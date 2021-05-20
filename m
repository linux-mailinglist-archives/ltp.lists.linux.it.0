Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9C5389FFF
	for <lists+linux-ltp@lfdr.de>; Thu, 20 May 2021 10:40:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED9F33C2FFB
	for <lists+linux-ltp@lfdr.de>; Thu, 20 May 2021 10:40:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DB4C93C0BB1
 for <ltp@lists.linux.it>; Thu, 20 May 2021 10:40:14 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 717121000798
 for <ltp@lists.linux.it>; Thu, 20 May 2021 10:40:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0015AAFD
 for <ltp@lists.linux.it>; Thu, 20 May 2021 08:40:13 +0000 (UTC)
References: <20210513152125.25766-1-rpalethorpe@suse.com>
 <20210513152125.25766-6-rpalethorpe@suse.com> <YKT5ZHrFW0/tCIhu@yuki>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <YKT5ZHrFW0/tCIhu@yuki>
Date: Thu, 20 May 2021 09:40:13 +0100
Message-ID: <874kexlrwy.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5/6] API/cgroups: Auto add controllers to
 subtree_control in new subgroup
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
>> -	if (dir->dir_root->ver == TST_CGROUP_V2)
>> +	if (dir->dir_root->ver != TST_CGROUP_V1)
>>  		cg->dirs_by_ctrl[0] = dir;
>
> This change is useless, isn't it?

Hopefully there will be no V3, but if there is it will most likely be a
unified hierarchy like V2.

Maybe this should have been in a seperate patch though?

>
>>  	for_each_ctrl(ctrl) {
>> -		if (has_ctrl(dir->ctrl_field, ctrl))
>> -			cg->dirs_by_ctrl[ctrl->ctrl_indx] = dir;
>> +		if (!has_ctrl(dir->ctrl_field, ctrl))
>> +			continue;
>> +
>> +		cg->dirs_by_ctrl[ctrl->ctrl_indx] = dir;
>> +
>> +		if (!parent || dir->dir_root->ver == TST_CGROUP_V1)
>> +			continue;
>> +
>> +		SAFE_CGROUP_PRINTF(parent, "cgroup.subtree_control",
>> +				   "+%s", ctrl->ctrl_name);
>>  	}
>
> Looks good. Agree that we should copy the controllers from parent here
> for V2.

Yup, as suggested by Li Wang.

>
>>  	for (i = 0; cg->dirs[i]; i++);
>> @@ -876,7 +885,7 @@ tst_cgroup_group_mk(const struct tst_cgroup_group *const parent,
>>  	for_each_dir(parent, 0, dir) {
>>  		new_dir = SAFE_MALLOC(sizeof(*new_dir));
>>  		cgroup_dir_mk(*dir, group_name, new_dir);
>> -		cgroup_group_add_dir(cg, new_dir);
>> +		cgroup_group_add_dir(parent, cg, new_dir);
>>  	}
>>  
>>  	return cg;
>> @@ -1029,7 +1038,7 @@ static struct tst_cgroup_group *cgroup_group_from_roots(const size_t tree_off)
>>  		dir = (typeof(dir))(((char *)root) + tree_off);
>>  
>>  		if (dir->ctrl_field)
>> -			cgroup_group_add_dir(cg, dir);
>> +			cgroup_group_add_dir(NULL, cg, dir);
>>  	}
>>  
>>  	if (cg->dirs[0]) {
>
> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
