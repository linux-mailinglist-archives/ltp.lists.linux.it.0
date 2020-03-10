Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 80046180076
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 15:42:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 500EA3C602F
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 15:42:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id B88153C5FF8
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 15:42:41 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 340552013D9
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 15:42:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583851359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dvVt4HD1pZhZloXZmHp7V+iQk+6OIJM3vkPBcq91hUA=;
 b=OJ3Yn4Ukm6JSlUM08EakhIOe1tYC3VSr9Lnkr/j6mM7K8q4kWtQ+CZqJvVS8hYLfxsdSi+
 igFJZSBbXAlUlk/YTmLoQF0BZWhhrcwKqfnaNoglfFBTOoSQRj957a4kIpISIW1pfnYvIn
 gxMf9lxsaPKrRpQk0I9sbw3NM7bGBz8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-Q6ExVQZTOuey8rHCmCIZ7g-1; Tue, 10 Mar 2020 10:42:35 -0400
X-MC-Unique: Q6ExVQZTOuey8rHCmCIZ7g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF210801E7B;
 Tue, 10 Mar 2020 14:42:34 +0000 (UTC)
Received: from localhost.localdomain (ovpn-123-211.rdu2.redhat.com
 [10.10.123.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B056773874;
 Tue, 10 Mar 2020 14:42:31 +0000 (UTC)
To: Greg KH <gregkh@linuxfoundation.org>, CKI Project <cki-project@redhat.com>
References: <cki.FE14F151C1.JS9OFUV72I@redhat.com>
 <20200310095312.GA2534479@kroah.com>
From: Rachel Sibley <rasibley@redhat.com>
Message-ID: <6e37f607-b607-7d05-bc21-b7b5a238af0a@redhat.com>
Date: Tue, 10 Mar 2020 10:42:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200310095312.GA2534479@kroah.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_PANICKED=3A_Test_report_for_kernel_5?=
 =?utf-8?q?=2E5=2E8-6afe1f4=2Ecki_=28stable-queue=29?=
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
Cc: Ondrej Moris <omoris@redhat.com>, Memory Management <mm-qe@redhat.com>,
 LTP Mailing List <ltp@lists.linux.it>, Ondrej Mosnacek <omosnace@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



On 3/10/20 5:53 AM, Greg KH wrote:
> On Tue, Mar 10, 2020 at 09:45:37AM -0000, CKI Project wrote:
>>
>> Hello,
>>
>> We ran automated tests on a recent commit from this kernel tree:
>>
>>         Kernel repo: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
>>              Commit: 6afe1f4aeae9 - ASoC: topology: Fix memleak in soc_tplg_manifest_load()
>>
>> The results of these automated tests are provided below.
>>
>>      Overall result: FAILED (see details below)
>>               Merge: OK
>>             Compile: OK
>>               Tests: PANICKED
> 
> Given that there's nothing I can do about this, I'm just starting to
> flat-out ignore the results of these emails :(


Hi Greg, I'm sorry for all the noise, the fix has already been posted here:
https://lore.kernel.org/lkml/20200224030007.3990-1-cai@lca.pw/

While we wait for it to make into stable-queue, I'm working on masking this panic in CKI.
There were several tests which could trigger the panic, not just LTP, so we need to mask it
in a way that we don't mask real problems.

In the mean time I have already waived the audit failures, you should no longer see these
failures for new pipelines triggered.

> 
> greg k-h
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
