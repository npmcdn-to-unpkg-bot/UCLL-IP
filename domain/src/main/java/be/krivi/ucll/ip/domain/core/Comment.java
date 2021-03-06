package be.krivi.ucll.ip.domain.core;

import be.krivi.ucll.ip.domain.common.Entity;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;

/**
 * Created by Krivi on 16/02/16.
 */
@javax.persistence.Entity
@Table( name = "comment" )
public class Comment extends Entity implements Comparable<Comment>{

    @NotBlank( message = "{NotBlank.Comment.comment}" )
    @Size( min = 2, max = 140, message = "{Size.Comment.comment}" )
    @Column( name = "comment" )
    private String comment;

    @NotNull( message = "{NotNull.Comment.timestamp}" )
    @Temporal( TemporalType.TIMESTAMP )
    private Date timestamp;

    public Comment(){
    }

    public Comment( String comment ){
        this.comment = comment;
        this.timestamp = new Date(  );
    }

    public String getComment(){
        return comment;
    }

    public void setComment( String comment ){
        this.comment = comment;
    }

    public Date getTimestamp(){
        return timestamp;
    }

    @Override
    public int compareTo( Comment o ){
        return timestamp.compareTo( o.getTimestamp() );
    }
}
