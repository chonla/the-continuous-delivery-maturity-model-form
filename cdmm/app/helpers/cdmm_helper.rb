module CdmmHelper
    def get_data_at(table, row_index, col_index)
        if row_index < 0 || col_index < 0
            []
        elsif table[:rows].count < row_index + 1
            []
        elsif table[:rows][row_index].count < col_index + 1
            []
        else
            table[:rows][row_index][col_index]
        end
    end

    def cell_key(table, row_index, col_index)
        "cell_#{row_index}_#{col_index}"
    end

    def all_checked?(table, row_index, col_index)
        data = get_data_at(table, row_index, col_index)
        unselected_caps = data.select { |cap| cap[:value] == "unchecked" }
        unselected_caps.count == 0
    end

    def label_to_key(label)
        label.gsub(/::/, '__')
            .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
            .gsub(/([a-z\d])([A-Z])/, '\1_\2')
            .downcase
            .gsub(/[^a-z]/, '_')
            .gsub(/__+/, '_')
            .gsub(/^_+/,'')
            .gsub(/_+$/, '')
    end
end
