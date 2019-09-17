Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 66891B4F08
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Sep 2019 15:21:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D14243C20AE
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Sep 2019 15:21:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 330FC3C20A0
 for <ltp@lists.linux.it>; Tue, 17 Sep 2019 15:21:35 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D501310016E4
 for <ltp@lists.linux.it>; Tue, 17 Sep 2019 15:21:26 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A70DA18C4294;
 Tue, 17 Sep 2019 13:21:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 973D3100EBA5;
 Tue, 17 Sep 2019 13:21:30 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 71D9A18089C8;
 Tue, 17 Sep 2019 13:21:30 +0000 (UTC)
Date: Tue, 17 Sep 2019 09:21:30 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Vladut Magas <vladut.m@l4b-software.com>
Message-ID: <2111602431.467047.1568726490174.JavaMail.zimbra@redhat.com>
In-Reply-To: <VI1PR0101MB2557E0698D03D10A8A95D71BF08F0@VI1PR0101MB2557.eurprd01.prod.exchangelabs.com>
References: <VI1PR0101MB2557E0698D03D10A8A95D71BF08F0@VI1PR0101MB2557.eurprd01.prod.exchangelabs.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.20]
Thread-Topic: Running kdump on Debian
Thread-Index: AQHVbUUiuga5u2FoKEeIY2RjUkkomnXSYJjy
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Tue, 17 Sep 2019 13:21:32 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] Running kdump on Debian
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> Hello,
> 
> I am trying to run the kdump testsuite on a Debian 9 distribution, but every
> test fails with "vmcore NOT FOUND".
> From what I understand, it is because /proc/vmcore is missing from my machine
> configuration.
> 
> I have the "crashkernel=256M@128M" parameter inside /etc/default/grub, and
> also nmi_watchdog=1.
> I also have inside the kernel configuration:
> CONFIG_PROC_VMCORE=y
> CONFIG_DEBUG_INFO=y
> CONFIG_KEXEC=y
> CONFIG_CRASH_DUMP=y
> and everything described in the documents as needed.
> 
> Also, for example, when trying to simulate with the SysRq it doesn't even
> finish as at some point it hangs and you have to close and restart manually
> the machine.
> A snapshot is attached.

Looks like kernel bug. If manual kdump doesn't work, then this is
outside of scope for LTP.

Panic is in virtualbox module, I'd try blacklisting it in kdump kernel,
and also consider trying different kernel version(s).

> 
> Can anyone please offer some support for this?
> Nothing I found on google worked until now!
> 
> Best regards,
> 
> Emanuel-Vladut Magas
> 
> L4B Software, Iasi, Romania
> E-mail: vladut.m@l4b-software.com
> 
> 
> 
> 
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
