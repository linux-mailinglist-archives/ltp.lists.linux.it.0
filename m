Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2754CFD34
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Mar 2022 12:42:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4A6723C1BC2
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Mar 2022 12:42:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 583CA3C07BD
 for <ltp@lists.linux.it>; Mon,  7 Mar 2022 12:42:11 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 814A9600840
 for <ltp@lists.linux.it>; Mon,  7 Mar 2022 12:42:10 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 8E698210FE;
 Mon,  7 Mar 2022 11:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646653329;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UkEl7uK6rbjRb/u3FPxdUmzQhWb66Z59MVQKWrI1+Qg=;
 b=X3l0iggJzsr+K12aEJfxmSHMxjzEhW+3T5BkA72QtnTeeydSS1jv0Y0cYDjZqpatXSi7dg
 dP/v3xi6zudox+HQ1ZYlZ+VwmGI0+23G26E9fbGC8XXnrF/Eae9EtV1xBIBkNtGwCZ8Icm
 aR9Dr9B84rW1CbM4LZ9XpPDK6rJbMKU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646653329;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UkEl7uK6rbjRb/u3FPxdUmzQhWb66Z59MVQKWrI1+Qg=;
 b=B+rYwa3vCAcchvz+2c0jen7WeJB5AXn1xgB9QxdZAKC11bVoubxHUiSG82Tb/DqYWTmRa2
 V0wOg5N5y6lE+RCA==
Received: from g78 (unknown [10.163.24.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 51CFAA3B8D;
 Mon,  7 Mar 2022 11:42:09 +0000 (UTC)
References: <cover.1646434670.git.luke.nowakowskikrijger@canonical.com>
 <ef5d94799195f00c6ab1fffe612e62bf1ee530a7.1646434670.git.luke.nowakowskikrijger@canonical.com>
 <87wnh6m2fp.fsf@suse.de>
User-agent: mu4e 1.6.10; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Luke Nowakowski-Krijger <luke.nowakowskikrijger@canonical.com>
Date: Mon, 07 Mar 2022 11:39:26 +0000
In-reply-to: <87wnh6m2fp.fsf@suse.de>
Message-ID: <87ilsqm1kg.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 08/16] controllers: Expand cgroup_lib shell
 library
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

>> +
>> +# Mounts and configures the given controller
>> +# USAGE: cgroup_require CONTROLLER
>> +cgroup_require()
>> +{
>> +	local ctrl="$1"
>> +	local exists
>> +
>> +	[ $# -eq 0 ] && tst_brk TBROK "cgroup_require: controller not defined"
>> +
>> +	[ ! -f /proc/cgroups ] && tst_brk TCONF "Kernel does not support
>> control groups"
>
> The tst_cgroup lib can handle this. Also is it guaranteed that
> /proc/cgroups exists if cgroups are enabled?
>
>> +
>> +	exists=$(grep -w $ctrl /proc/cgroups | awk '{ print $4 }')
>> +	[ "$exists" != "1" ] && tst_brk TCONF "cgroup_require:
>> Controller not available or not enabled"
>
> For some reason this fails on my VM where no cgroups are mounted
> already. Also it's redundant because tst_cgroup should handle it.
>
>> +
>> +	_cgroup_state=$(tst_cgctl require "$ctrl" $$)
>> +
>> +	[ "$_cgroup_state" = "" ] && tst_brk TBROK "cgroup_require: No
>state was set after call. Controller '$ctrl' maybe does not exist?"

Perhaps we can just check the return status of tst_cgctl and exit the
script if it is >0?

>> +
>> +	return 0
>>  }


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
