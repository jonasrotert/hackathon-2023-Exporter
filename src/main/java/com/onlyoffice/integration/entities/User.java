/**
 *
 * (c) Copyright Ascensio System SIA 2023
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

package com.onlyoffice.integration.entities;

import lombok.Getter;
import lombok.Setter;

import jakarta.persistence.CollectionTable;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import java.util.List;

@Entity
@Table(name = "`user`")
@Getter
@Setter
public class User extends AbstractEntity {
    private String name;
    private String email;
    private Boolean favorite;
    @ManyToOne
    private Group group;
    @OneToOne
    private Permission permissions;
//    @Column(columnDefinition = "CLOB")
    @ElementCollection
    @CollectionTable(name = "user_descriptions")
    private List<String> descriptions;
}
