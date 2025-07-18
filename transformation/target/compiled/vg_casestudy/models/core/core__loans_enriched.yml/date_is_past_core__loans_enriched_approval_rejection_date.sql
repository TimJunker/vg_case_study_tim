

    select *
    from "casestudy"."core"."core__loans_enriched"
    where approval_rejection_date > current_date()
    
