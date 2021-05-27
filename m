Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3838D39270C
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 08:02:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E2C503C772F
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 08:02:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1717F3C0BB1
 for <ltp@lists.linux.it>; Thu, 27 May 2021 08:02:13 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 11E8C600277
 for <ltp@lists.linux.it>; Thu, 27 May 2021 08:02:12 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 464641FD29;
 Thu, 27 May 2021 06:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622095332;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nxs53B0uf2acDRGl4nUIBYnRTrl66LXykTY/1etym84=;
 b=aHuBPiyq5BPzDxKtmsoaG0fxsOXi6eGXQjrrXm8pgiHayy4PqFTrgIAA2XicCrjbk5kojh
 lRhKZ1JnM9BRqttI7UlzY1hHzJDtQFFRDtp2s7PCc0pTHgsh1MiCpMN6ihbBcq11bFjqJq
 OgidCtECckMuF7pFi7v79JQWbYCdYAM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622095332;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nxs53B0uf2acDRGl4nUIBYnRTrl66LXykTY/1etym84=;
 b=0P8bD16wtF2qCjfrHoU1tcAnbDld3LKxW0WSL1/DZEoyi9HfOsOoN7RrKIa0T3kVnrLHOa
 xuSVAxsgt7ZkpPBw==
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 1B04411A98;
 Thu, 27 May 2021 06:02:12 +0000 (UTC)
Date: Thu, 27 May 2021 08:02:10 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YK814g7TF3JDy37G@pevik>
References: <20210526154949.4473-1-pvorel@suse.cz>
 <CAEemH2ecppttvGW1JeJ_E=w1eUJYEY8+Sx8Euztn2MhRYykEKQ@mail.gmail.com>
 <CAEemH2fGaxQuTvpV1gEp8hVoeHo=42ikSRYs+5RmCuJQfJQa-g@mail.gmail.com>
 <YK8d5APc1VZ0Q7T+@pevik>
 <CAEemH2doGFdk395L5t7cGBKT63AzORNjEU4=H6qQFbXjO2xCTA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2doGFdk395L5t7cGBKT63AzORNjEU4=H6qQFbXjO2xCTA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] doc: Split test-writing-guidelines
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>,
 Richard Palethorpe <rpalethorpe@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On Thu, May 27, 2021 at 12:19 PM Petr Vorel <pvorel@suse.cz> wrote:

> > Hi Li, all,

> > > > > https://github.com/pevik/ltp/wiki/Test-Writing-Guidelines
> > > > > https://github.com/pevik/ltp/wiki/C-Test-API

> > > Seems we have a similar guideline "c-test-tutorial-simple.txt",
> > > maybe better to combine them together?
> > I'd prefer to keep them separate. Because otherwise page gets long again.
> > But I'd consider to unify names ("LTP C Test API" vs. "C Test Case Tutorial"
> > - API vs. Case).

> No problem, I'm OK with unifying names.

> And yes, we can rename with the same prefix start on purposely to make
> them keep nearby in alphabetical sorting.

I'm not sure myself about renaming. But adding list of files generated by us in
HOME [1] and Developers corner [2] should help.

Also I'd add some NOTE: See also links (eg. to C Test API at the top in C Test
Case Tutorial and vice versa, in Shell Test API to C Test API and vice versa).

> > > > > https://github.com/pevik/ltp/wiki/Shell-Test-API

> > > Forgot to mention, with the increased number of docs, do you think it
> > > necessary to create an index for including all documents in a sort?
> > There is list of pages on the right. But as it's sorted alphabetically,
> > it's not enough. Maybe we should add this list to README.md and to HOME wiki
> > page.

> To HOME wiki sounds good, we can do a simple triage in there.

> Thanks a lot for the documentation work!
Thanks for your review!

Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/wiki
[2] https://github.com/linux-test-project/ltp#developers-corner

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
