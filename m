Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD16690A5F
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Feb 2023 14:36:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 817BC3CB73E
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Feb 2023 14:36:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D4C293C03EB
 for <ltp@lists.linux.it>; Thu,  9 Feb 2023 14:36:08 +0100 (CET)
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9700A200747
 for <ltp@lists.linux.it>; Thu,  9 Feb 2023 14:36:05 +0100 (CET)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 319DZtNf002205;
 Thu, 9 Feb 2023 21:35:55 +0800 (+08)
 (envelope-from ycliang@andestech.com)
Received: from ubuntu01 (10.0.12.75) by ATCPCS16.andestech.com (10.0.1.222)
 with Microsoft SMTP Server id 14.3.498.0; Thu, 9 Feb 2023 21:35:51 +0800
Date: Thu, 9 Feb 2023 13:35:39 +0000
From: Leo Liang <ycliang@andestech.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <Y+T2qzXrZcGK/EQt@ubuntu01>
References: <20230207124008.1788759-1-ycliang@andestech.com>
 <Y+JVPi5jo++joA/g@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+JVPi5jo++joA/g@pevik>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Originating-IP: [10.0.12.75]
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 319DZtNf002205
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.4 required=7.0 tests=PDS_RDNS_DYNAMIC_FP,
 RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] tst_pids.c: fix fork failure on small memory
 systems
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

Hi Petr,

On Tue, Feb 07, 2023 at 02:42:22PM +0100, Petr Vorel wrote:
> Hi Leo,
> 
> > Running syscalls/msgstress03 on a system with less than ~1 GB of RAM fails:
> 
> > 	msgstress03    1  TFAIL  :  msgstress03.c:163:  Fork failed (may be OK if under stress)
> 
> > The reason is that besides /proc/sys/kernel/pid_max, /proc/sys/kernel/threads-max
> > is another factor determining how many processes a system could create.
> 
> > Use the smaller number between pid_max and threads-max as the nprocs.
> 
> Makes sense.
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> BTW IMHO it'd be better to rewrite
> f = popen("ps -eT | wc -l", "r");
> to list count of /proc/[0-9]*/ in plain C (TODO for us).
>

Thanks for the review!
I could send a v2 to add this as well.

Best regards,
Leo

> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
