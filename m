Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FB23A86B3
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 18:40:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AE2F93C98ED
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 18:40:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id ADC853C2794
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 18:40:47 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3E5501A009BD
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 18:40:46 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 90DE21FD49;
 Tue, 15 Jun 2021 16:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623775246;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LCbjci3woWUe36qOwy8JkDZ2AVNqQoDMb7CLBNN/s0o=;
 b=0ppVX5H3StUz8IQiUv3CzqDqVCDeIA6vxhp0HQ/JfdfIZBqzWPaiaBjz2qM181vjL20/Tq
 zPfe2Q2pB6507OOAbxppsHxtkmhpZ2ega5KobZggsARHlSOUqjXgt7XQnEdQZ+fa8E3GtT
 QsD2NzzyR2UG29AN5ivHoSAMY3O6G7k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623775246;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LCbjci3woWUe36qOwy8JkDZ2AVNqQoDMb7CLBNN/s0o=;
 b=Uwq9qGvLktR2NFsyDfakQVfZ8qKejt3Fjewk58vowBrCwawjVfpznj/gL4K1H7X/RpH8hJ
 l9VZlUSLohIjcqDw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 5CE0D118DD;
 Tue, 15 Jun 2021 16:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623775246;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LCbjci3woWUe36qOwy8JkDZ2AVNqQoDMb7CLBNN/s0o=;
 b=0ppVX5H3StUz8IQiUv3CzqDqVCDeIA6vxhp0HQ/JfdfIZBqzWPaiaBjz2qM181vjL20/Tq
 zPfe2Q2pB6507OOAbxppsHxtkmhpZ2ega5KobZggsARHlSOUqjXgt7XQnEdQZ+fa8E3GtT
 QsD2NzzyR2UG29AN5ivHoSAMY3O6G7k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623775246;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LCbjci3woWUe36qOwy8JkDZ2AVNqQoDMb7CLBNN/s0o=;
 b=Uwq9qGvLktR2NFsyDfakQVfZ8qKejt3Fjewk58vowBrCwawjVfpznj/gL4K1H7X/RpH8hJ
 l9VZlUSLohIjcqDw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id nhCqFA7YyGA5AwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 15 Jun 2021 16:40:46 +0000
Date: Tue, 15 Jun 2021 18:40:44 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YMjYDEXWlD7M/Dfp@pevik>
References: <20210610175812.13730-1-ycliang@andestech.com>
 <CAEemH2f-=oW3PqJN6EsCvBzvPk2LvrwkLd1oVgHgv+_HHN_oTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2f-=oW3PqJN6EsCvBzvPk2LvrwkLd1oVgHgv+_HHN_oTQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] fs/racer: Fix LTP hang caused by fs_racer.sh
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

Hi Leo, Li,

> On Fri, Jun 11, 2021 at 1:58 AM Leo Yu-Chi Liang <ycliang@andestech.com> wrote:

> > fs_racer.sh test could cause LTP to hang if the file
> > gets removed when it's at time same time being renamed.

> > The if statement in mv source implemented by busybox is as follows:

> >         if (dest_exists) {
> >                 if (flags & OPT_NOCLOBBER)
> >                         goto RET_0;
> >                 if (!(flags & OPT_FORCE)           // OPT_FORCE is set by -f option
> >                  && ((access(dest, W_OK) < 0 && isatty(0))
> >                     || (flags & OPT_INTERACTIVE))  // this is set by -i option
> >                 ) {
> >                         if (fprintf(stderr, "mv: overwrite '%s'? ", dest) < 0) {
> >                                 goto RET_1;  /* Ouch! fprintf failed! */
> >                         }
> >                         if (!bb_ask_y_confirmation()) {
> >                                 goto RET_0;
> >                         }
> >                 }
> >         }

> > If somehow the dest_file exists when mv executes the first if "if (dest_exists)",
> > and gets removed when mv executes the third if "if (access(...))".
> > Then it is possible for mv to reach "bb_ask_y_confirmation" and to try to read from tty.

> > However, the mv process is executing in the background,
> > so when it tries to read from tty,
> > the processes in the same process group as mv would all receive SIGTTIN
> > and be changed into TASK_STOPPED state.

> > This would cause this testcase to hang, though happens rarely.

> > Add -f option to suppress the attempt to read from tty.

> > Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>

> Reviewed-by: Li Wang <liwang@redhat.com>

Fix is trivial enough to merge it => merged.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
