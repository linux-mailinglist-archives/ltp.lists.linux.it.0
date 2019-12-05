Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 108E3114166
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Dec 2019 14:20:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C05233C2430
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Dec 2019 14:20:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 94B263C23C2
 for <ltp@lists.linux.it>; Thu,  5 Dec 2019 14:20:34 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 028FF1A014FD
 for <ltp@lists.linux.it>; Thu,  5 Dec 2019 14:20:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575552032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cJyxY1ryR+H7+yfgWaQHVmhV8TVJVyojT9hIN067P+w=;
 b=QPPdto1oxHVemShaw1mCfVY90NvAQxNDmyjaZ4BpGmEHkru4hzJquu8Q+em65bSsLXU4lG
 2GWIi8OTxU+IaQlQy6jaN6j5arSOCRSntLGIuMwryp4mCQlse702HSq+gXN4wp7leHMWGu
 NvWD5duwR0KtxkPl0n4BvEtZDV5HOBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-ZQblEEkyM1y2Q8UH6AGMLg-1; Thu, 05 Dec 2019 08:20:30 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6670A91221;
 Thu,  5 Dec 2019 13:20:29 +0000 (UTC)
Received: from localhost.localdomain (ovpn-122-165.rdu2.redhat.com
 [10.10.122.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDC6660135;
 Thu,  5 Dec 2019 13:20:19 +0000 (UTC)
To: Cyril Hrubis <chrubis@suse.cz>, CKI Project <cki-project@redhat.com>
References: <cki.A05205186F.8840CLEZ0B@redhat.com>
 <20191205122735.GB5693@rei.lan>
From: Rachel Sibley <rasibley@redhat.com>
Message-ID: <ad2609c0-81f2-513d-6f50-0e492374e359@redhat.com>
Date: Thu, 5 Dec 2019 08:20:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191205122735.GB5693@rei.lan>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: ZQblEEkyM1y2Q8UH6AGMLg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] ??? FAIL: Test report for kernel 5.2.21-rt14-eccdce6.cki
 (rt-devel)
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
Cc: Memory Management <mm-qe@redhat.com>, LTP Mailing List <ltp@lists.linux.it>,
 Kernel RT Team <kernel-rt-ci@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



On 12/5/19 7:27 AM, Cyril Hrubis wrote:
> Hi!
>> We ran automated tests on a recent commit from this kernel tree:
>>
>>         Kernel repo: git://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git
>>              Commit: eccdce6cb526 - v5.2.21-rt14
>>
>> The results of these automated tests are provided below.
>>
>>      Overall result: FAILED (see details below)
>>               Merge: OK
>>             Compile: OK
>>               Tests: FAILED
>>
>>      Pipeline: https://xci32.lab.eng.rdu2.redhat.com/cki-project/cki-pipeline/pipelines/323141
> 
> This URL does not seem to be accessible from outside.

Sorry about that, the template was set incorrectly for this tree, we
have since fixed it.

The test case which failed was mount01:

<<<test_start>>>
tag=mount01 stime=1575466201
cmdline="mount01"
contacts=""
analysis=exit
<<<test_output>>>
mke2fs 1.45.3 (14-Jul-2019)
/dev/loop0 is apparently in use by the system; will not make a 
filesystem here!
mount01     0  TINFO  :  Using test device LTP_DEV='/dev/loop0'
mount01     0  TINFO  :  Formatting /dev/loop0 with ext2 opts='' extra 
opts=''
mount01     1  TBROK  :  tst_mkfs.c:100: mkfs.ext2:1: mount01.c failed 
with 86
mount01     2  TBROK  :  tst_mkfs.c:100: Remaining cases broken
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=2 corefile=no
cutime=0 cstime=0
<<<test_end>>>

> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
