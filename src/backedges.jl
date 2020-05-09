function all_backedges(mi)
    backedges = Set{MethodInstance}()
    visit_backedges(x->(push!(backedges, x); true), mi)
    delete!(backedges, mi)
    return collect(backedges)
end

function terminal_backedges(mi)
    backedges = Set{MethodInstance}()
    visit_backedges(mi) do x
        if !isdefined(x, :backedges) || isempty(x.backedges)
            push!(backedges, x)
        end
        true
    end
    delete!(backedges, mi)
    return collect(backedges)
end
