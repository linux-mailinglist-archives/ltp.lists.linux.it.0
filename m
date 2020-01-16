Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C38B313E048
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jan 2020 17:39:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 78E013C23AB
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jan 2020 17:39:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 08C143C2366
 for <ltp@lists.linux.it>; Thu, 16 Jan 2020 17:39:31 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id DDFA3601DC7
 for <ltp@lists.linux.it>; Thu, 16 Jan 2020 17:39:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579192769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0oQoERwC/UCiV5sEOFoxpyR1DJBx5VM+Hk9f8UrP3nE=;
 b=DIwRcHbpvGCYE9R7NojOcmBxSv3OFeqfmcSIMNUdVdMYPo4IdbFipMZHCtjcnaxIZ7IIBe
 A8G6syW+Pldl11hHGAYDNHwl9SNxavwf7vuhpT/LtfGJfVvF1p8YWVapycuDmP3YHHJQKh
 V1Ek27Cn3i+l8v1Ayd2Tfw+T1GrgN/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-WqD75J3MM7Kid9Vg3EnfGA-1; Thu, 16 Jan 2020 11:39:24 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EDC91034B07;
 Thu, 16 Jan 2020 16:39:23 +0000 (UTC)
Received: from localhost.localdomain (ovpn-120-211.rdu2.redhat.com
 [10.10.120.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11E565D9C9;
 Thu, 16 Jan 2020 16:39:15 +0000 (UTC)
To: Cyril Hrubis <chrubis@suse.cz>, CKI Project <cki-project@redhat.com>
References: <cki.0.BMO32N203K@redhat.com> <20200116155952.GB558@rei>
From: Rachel Sibley <rasibley@redhat.com>
Message-ID: <b251c469-ade3-bc34-8e07-1789640693e8@redhat.com>
Date: Thu, 16 Jan 2020 11:39:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200116155952.GB558@rei>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: WqD75J3MM7Kid9Vg3EnfGA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] ??? FAIL: Test report for kernel 5.4.12-100.fc30
 (fedora-30)
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
Cc: Memory Management <mm-qe@redhat.com>, skt-results-master@redhat.com,
 jforbes@redhat.com, LTP Mailing List <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



On 1/16/20 10:59 AM, Cyril Hrubis wrote:
> Hi!
>>      Pipeline: https://xci32.lab.eng.rdu2.redhat.com/cki-project/brew-pipeline/pipelines/384229
> 
> Looks like unreachable URL again.
> 

Oops sorry about that, since the Fedora maintainers had access to internal logs we used the regular
template, only after did we start cc'ing LTP for upstream failures. I just changed it to the correct
email template to include links to our external logs.

The failure was a dmesg check probably related to running on a slow kvm guest:

[ 5646.612562] watchdog: BUG: soft lockup - CPU#15 stuck for 31s! [systemd-journal:559]
[ 5840.828707] watchdog: BUG: soft lockup - CPU#10 stuck for 23s! [systemd:1]
[ 6018.881344] watchdog: BUG: soft lockup - CPU#2 stuck for 50s! [systemd-coredum:819905]
[ 6047.933641] watchdog: BUG: soft lockup - CPU#15 stuck for 21s! [systemd:1]
[ 6100.825887] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [systemd-coredum:819905]
[ 6369.103978] watchdog: BUG: soft lockup - CPU#5 stuck for 23s! [diotest6:819897]
[ 6780.415986] watchdog: BUG: soft lockup - CPU#10 stuck for 22s! [khvcd:223]
[ 6831.956434] watchdog: BUG: soft lockup - CPU#3 stuck for 70s! [migration/3:25]
[ 6831.956436] watchdog: BUG: soft lockup - CPU#2 stuck for 52s! [kworker/2:2:1997]
[ 6864.394439] watchdog: BUG: soft lockup - CPU#3 stuck for 22s! [rcu_sched:10]
[ 7004.381847] watchdog: BUG: soft lockup - CPU#2 stuck for 22s! [rcu_sched:10]
[ 7084.688008] watchdog: BUG: soft lockup - CPU#4 stuck for 67s! [kworker/4:3:818401]
[ 7108.389938] watchdog: BUG: soft lockup - CPU#4 stuck for 22s! [rcu_sched:10]
[ 7303.256283] watchdog: BUG: soft lockup - CPU#7 stuck for 110s! [diotest6:819970]

-Rachel


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
