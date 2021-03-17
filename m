Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2681F33F007
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 13:10:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D4C0C3C2DB8
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 13:10:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 622573C0788
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 13:10:07 +0100 (CET)
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C253120076A
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 13:10:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=BEMwz
 LtqSSwqoHIlnSe3qq+eTnbRfLXRvSXPOPctXa4=; b=KiyDtB6UpkR07xOZwsOFg
 H0AeA8SUW//xHtfzaeiFCBUz4YRdvr1k/BnH51yipiV7b9yUCZgk5X9PWEgnCw5L
 o7yg8WusTUT6/Vo/n8dvJCsdICbyAMem04+zGbTDQECI/cxdinX0zuPS2sbf2oyQ
 Nx08cW2FWzhpHuzWQ38pS4=
Received: from [192.168.0.11] (unknown [183.210.48.59])
 by smtp7 (Coremail) with SMTP id C8CowADX0vKO8VFggZnzSg--.8617S2;
 Wed, 17 Mar 2021 20:09:51 +0800 (CST)
To: Petr Vorel <pvorel@suse.cz>, "yangx.jy@fujitsu.com" <yangx.jy@fujitsu.com>
References: <20210317100154.20389-1-zhaogongyi@huawei.com>
 <YFHghQWbAmjmKDx3@pevik>
 <OS0PR01MB6371A1E607BDFBC2421E6788836A9@OS0PR01MB6371.jpnprd01.prod.outlook.com>
 <YFHpSspnD52A8N0P@pevik>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <49c114a6-e662-473c-340d-12a3c76f7471@163.com>
Date: Wed, 17 Mar 2021 20:09:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <YFHpSspnD52A8N0P@pevik>
Content-Language: en-US
X-CM-TRANSID: C8CowADX0vKO8VFggZnzSg--.8617S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFWUCF4fAr45Xw48KF1fCrg_yoWfWwc_ur
 Wqvas2ganFk393JFsxAF4Yy3y2kw48Ary7X3s2kryfZryrKwsxA3WvkrWIvw1fua97Awn7
 CrZaq34Sg342vjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUeMmh7UUUUU==
X-Originating-IP: [183.210.48.59]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiqA9YXlc7T9E0CgAAst
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?b?5Zue5aSNOiBbUEFUQ0ggdjJdIGNsZWFudXA6IFVuaWZ5IHRo?=
 =?utf-8?q?e_annotation_style_and_remove_Redundant_code?=
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


On 3/17/21 7:34 PM, Petr Vorel wrote:
> Hi all,
>
>>> Hi Gongyi,
>>>> Change 'DESCRIPTION' to 'Description' and change 'ALGORITHM' to
>>>> 'Algorithm', and remove Redundant tst_reap_children since
>>>> tst_reap_children has been called in the test skeleton.
>>> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>> Hi Petr,
>> If we want to unify the format of 'Description' and 'Algorithm' in test, it seems redundant to do the conversion in testinfo.pl, right?
>> Can we use either of them(not both of them) because it is unnecessary to do the same thing twice.
> I'd keep both: this is for cleanup of old approach, conversion in testinfo.pl in
> case there is inconsistency in the future.
>
> But not a strong opinion about it, it's not that important.

Hi Petr,

Other than that, it looks good to me.

Acked-by: Xiao Yang <yangx.jy@cn.fujitsu.com>

Best Regards,

Xiao Yang

>
> Kind regards,
> Petr
>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
