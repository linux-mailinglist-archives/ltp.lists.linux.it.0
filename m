Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B0A3C45A7
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 08:40:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EDCDE3C75DF
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 08:40:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 57ADB3C1CE5
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 08:40:42 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5F56A6007A7
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 08:40:41 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 978AB1FD59;
 Mon, 12 Jul 2021 06:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626072040;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=po+hSgB5ScAElRy4+TleFqY1vmZ7x35N99zf/PEwX+g=;
 b=gfwEYDXj446GAnihD3K4c94NBAhOQtd6zT0w8V8yDfHiLXzO6s/VjR0dneWWJ0FM23qzAb
 +S8zIiHDk3AAyQkC733dFnjkFeQzKRFTwSBOBt7Es0wo/KHHhKl1dkhgGejITNVOJ7iI/B
 nFOvb5aiVQbTrJe192E6bnotC+XEyaM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626072040;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=po+hSgB5ScAElRy4+TleFqY1vmZ7x35N99zf/PEwX+g=;
 b=BYW3LKZRrJl7NFBoOqilN90ah5Yd6JOJiAfYDgRArk/LybmYBb12INLuZ0DG0MGRqlt+7o
 dpMeMny9uaSNppBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6045913AC2;
 Mon, 12 Jul 2021 06:40:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id M00PFujj62BodQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 12 Jul 2021 06:40:40 +0000
Date: Mon, 12 Jul 2021 08:40:38 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YOvj5p/5KL2uRNpT@pevik>
References: <20210709140143.9180-1-pvorel@suse.cz>
 <CAEemH2fB5VakafKhTgcOsvwK6Q50AJ3WcpRY2fSLfhB86b03Nw@mail.gmail.com>
 <YOvX/tczl7Duu+6L@pevik>
 <34959e10-45fc-f7ea-9e2d-ebe186a97859@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <34959e10-45fc-f7ea-9e2d-ebe186a97859@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] tst_net.sh: Declare prefix variable as empty
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

> Hi,

> On 7/12/2021 7:49 AM, Petr Vorel wrote:
> > Thanks for a review!
> > It's a bit strange to add '=' only single variable, maybe I should have rename
> > the variable.

> > Paranoid approach would be to add '=' to any variable which is assigned only on
> > some circumstance or even any variable which is not assigned to any value.
> > But we probably don't want to do it.
> I think good common practice would be to add it to all variables, where it
> matters.
> There are probably only very few places, where a local variable is not
> assigned before being accessed.
> Maybe there is some kind of shell code linter, that can find uninitialized
> variables?
> A good linter could also find variables, that should be local, but are not.
> But I have never looked into shell code linting.

Thanks for your input.

I'm aware only of shellcheck [1], which I'm not a big fan of (false positives,
useless hints). And yes, in this case it warns about 'local' not being POSIX
=> useless :(.

In testcases/lib/tst_net.sh line 411:
	local counter host_id host_range is_counter max_host_id min_host_id net_id prefix tmp type
        ^-- SC3043: In POSIX sh, 'local' is undefined.


> In fs_bind_lib.sh, OPTIND in fs_bind_check probably also requires setting to
> empty, or better 0.
We use tst_test.sh in OPTIND=1 ("The index of the next argument to be processed
by the getopts builtin command")

> But maybe dash's implementation of getopts does not require it. I only had
> to add local OPTIND for busybox sh iirc...
I used to set local OPTIND (in tst_net.sh), which is obviously not working on
dash.

> Yet another case of: Shellcode is unpredictable :)
Yep, I love shell (understand why everything is slowly rewritten into C).

Kind regards,
Petr

> Joerg

[1] https://github.com/koalaman/shellcheck

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
