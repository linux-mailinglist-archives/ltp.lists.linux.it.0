Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DC413A3C3
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jan 2020 10:27:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3585C3C2360
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jan 2020 10:27:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 1F53C3C088A
 for <ltp@lists.linux.it>; Tue, 14 Jan 2020 10:27:37 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 1BB716009BB
 for <ltp@lists.linux.it>; Tue, 14 Jan 2020 10:27:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578994055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z8+bKHzRQJACFmPDIVLcyDDbEdjHwMUrvRaj99dfdrg=;
 b=Lo1WYOjeN/CT0zpuPfNYulUq1FhbFuy68pbCwMhYDFVMB1M01crEWUTZ+VLtlb3jQlW8GH
 DzGjD89YgW1vpSVOUa9vT6uunTjNWlAhuJKXhZRfI0MU0BSZvCvzLQ+JoEcScc7TpibMb2
 Es+31dAgcWpf/40IfaLYuW/eBHkAb8I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-bpuQj9BMPSqBjRGOxRz5JA-1; Tue, 14 Jan 2020 04:27:31 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D426107ACC5;
 Tue, 14 Jan 2020 09:27:30 +0000 (UTC)
Received: from localhost (dhcp-12-102.nay.redhat.com [10.66.12.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73DCD1084381;
 Tue, 14 Jan 2020 09:27:27 +0000 (UTC)
Date: Tue, 14 Jan 2020 17:36:33 +0800
From: Zorro Lang <zlang@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200114093633.GD14282@dhcp-12-102.nay.redhat.com>
Mail-Followup-To: Petr Vorel <pvorel@suse.cz>,
 Cyril Hrubis <chrubis@suse.cz>, Jan Stancek <jstancek@redhat.com>,
 Li Wang <liwang@redhat.com>, ltp@lists.linux.it
References: <20191209160227.16125-1-zlang@redhat.com>
 <20191226072338.GH14328@dhcp-12-102.nay.redhat.com>
 <20200113153141.GA14282@dhcp-12-102.nay.redhat.com>
 <20200114081449.GB3468@dell5510>
MIME-Version: 1.0
In-Reply-To: <20200114081449.GB3468@dell5510>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: bpuQj9BMPSqBjRGOxRz5JA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/newmount: new test case for new mount
 API
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

On Tue, Jan 14, 2020 at 09:14:49AM +0100, Petr Vorel wrote:
> Hi Zorro,
> 
> > > It's been several weeks passed. Is there more review points?
> 
> > ping again ... is there anything block this patch review?
> Here are my comments to your v3 review [1]. Some of them are now irrelevant
> as you're fixed them in v3 (Cyril ones from v1).

Wow, now I know why I didn't get any response for such long time. The emails
from you and Cyril were all sent to mail list, not to/cc me. I didn't pay so
much attention to the mail list. Sorry about that.

> 
> So it might be just .dev_fs_flags = TST_FS_SKIP_FUSE and tiny style fixes like
> is_mounted = 0. I wanted to fix them myself and merge, but didn't find a time.
> Sending v4 where you fix/implement suggestions generally helps speedup merging
> (as I already told you) :).

I'll read your review points, and send a V4 tonight.

Thanks,
Zorro

> 
> The real question is whether to merge this before release. I'd like it to be in
> the release, but it depends on other maintainers opinion.
> Cyril, Jan, Li? WDYT?
> 
> Kind regards,
> Petr
> 
> [1] https://patchwork.ozlabs.org/patch/1206389/#2333978
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
