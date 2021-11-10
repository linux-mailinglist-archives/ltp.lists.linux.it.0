Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D87FF44BE7C
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Nov 2021 11:21:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7507F3C13C5
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Nov 2021 11:21:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5904B3C091D
 for <ltp@lists.linux.it>; Wed, 10 Nov 2021 11:21:10 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3B7E01401180
 for <ltp@lists.linux.it>; Wed, 10 Nov 2021 11:21:09 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 6532B21921;
 Wed, 10 Nov 2021 10:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636539669;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y2Ss8ORJnGrXV8yM2qwhBhjfq1xKmKf1L07GNjSiB7w=;
 b=CFD/qmHUjxILpMj4EkjuX7QRiVS1Aqwm5lH3fPqU/2gXYsUttW6G5olLyzPKIZYjkooaYc
 3asrvmPcGk+NTA0vEH3bMLu5s869m/PNJ2Oy+77kRdTyThc/5/JLG54Y4x9QdCIRuFW4SH
 b9sk74DU0uFRPSkVakhp2EvPH/lMhvA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636539669;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y2Ss8ORJnGrXV8yM2qwhBhjfq1xKmKf1L07GNjSiB7w=;
 b=ENMQbBJ78C/Ix/Xf/Zrd/FVl5HSfjHExQf5076a+ssgrgyYjQzKFTkIbhmHPSVZXLq5Bfd
 HuN3WrUVahbJMNAA==
Received: from g78 (rpalethorpe.udp.ovpn1.nue.suse.de [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 24561A3B87;
 Wed, 10 Nov 2021 10:21:09 +0000 (UTC)
References: <1545987769-32388-1-git-send-email-lijinyue@huawei.com>
 <20190313115844.GB2606@dell5510>
User-agent: mu4e 1.6.9; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
Date: Wed, 10 Nov 2021 10:06:34 +0000
In-reply-to: <20190313115844.GB2606@dell5510>
Message-ID: <87czn8qpkd.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] controllers/cpuset: add cpuset files check for
 different OS
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

Petr Vorel <pvorel@suse.cz> writes:

> Hi Li,
>
>> While mounting cpuset cgroup, the subsystem directory entries
>> differ in different OS release.
>> eg, cpuset.cpus file on Ubuntu and cpus on some other release.
> Which ones, please? I'm not aware of anyone.

Unfortunately it is possible. cpuset can be mounted without a prefix
using a legacy compatability option. OTOH this is really ancient.

>
>> So we add cpuset files checker to make sure the test work well
>> on all OS release.
>
> ...
>> +++ b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
> ...
>> +cpus_file=
>> +cpu_exclusive_file=
>> +mems_file=
>> +memory_pressure_file=
>> +memory_pressure_enabled_file=
>> +mem_exclusive_file=
>> +mem_hardwall_file=
>> +memory_migrate_file=
>> +memory_spread_page_file=
>> +memory_spread_slab_file=
>> +sched_load_balance_file=
>> +sched_relax_domain_level_file=
> Maybe move the ones in $CPUSET/cpuset.cpus clause here as the default ones
> and move those from else clause into setup.
>
> ...
>> +# check cpuset cgroup files for different OS
>> +cpuset_files_check()
>> +{
>> +	setup
> I guess this should be vice versa, i.e. cpuset_files_check() be part of setup()
> And then not needed to be added into all functions using cpuset_funcs.sh

Probably we could just do

if [ -f $CPUSET/cpuset.cpus" ]; then
   cpuset_prefix="cpuset."
else
   cpuset_prefix=
fi

then replace cpuset. with $cpuset_prefix

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
