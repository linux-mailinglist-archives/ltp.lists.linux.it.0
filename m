Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4E234E58C
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 12:37:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4C5DE3C780E
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 12:37:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A30983C2453
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 12:36:55 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 91973200741
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 12:36:55 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D7184B1F3;
 Tue, 30 Mar 2021 10:36:54 +0000 (UTC)
To: rpalethorpe@suse.de, Petr Vorel <pvorel@suse.cz>
References: <20210329145738.986-1-pvorel@suse.cz> <87czvhneqb.fsf@suse.de>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <41d6efe9-c028-6029-44c0-974222832051@suse.cz>
Date: Tue, 30 Mar 2021 12:36:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87czvhneqb.fsf@suse.de>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] tst_mkfs: Add -I option to mkfs.vfat
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
Cc: ltp@lists.linux.it, Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 30. 03. 21 12:00, Richard Palethorpe wrote:
> Hello,
> 
> Petr Vorel <pvorel@suse.cz> writes:
> 
>> to workaround occasional error on tests with .all_filesystems flag:
>>
>> tst_test.c:888: TINFO: Formatting /dev/loop0 with vfat opts='' extra opts=''
>> mkfs.vfat: Partitions or virtual mappings on device '/dev/loop0',
>>  not making filesystem (use -I to override)
>> tst_test.c:888: TBROK: mkfs.vfat failed with exit code 1
>>
>> Tested also on BusyBox v1.33.0, which accept but ignores -I since
>> beginning (1.14.0).
>>
>> Signed-off-by: Petr Vorel <pvorel@suse.cz>
>> ---
>> Richard also suggested to wipe the device, but not sure how to do it
>> quickly and don't bring any more dependency.
> 
> I guess that you only need to wipe the headers by writing zeros to the
> device. That is unless this is actually refering to a mapping in
> /dev/mapper?

We already call tst_clear_device(dev) in tst_mkfs_() but mkfs.vfat keeps
randomly failing with loop devices anyway.

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
