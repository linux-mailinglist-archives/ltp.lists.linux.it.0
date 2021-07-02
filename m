Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC393BA034
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 14:06:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C3DC3C84FB
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 14:06:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 40A923C6AD7
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 14:06:36 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id ADA671001376
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 14:06:35 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 24820228E6;
 Fri,  2 Jul 2021 12:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625227595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Iu+v3CTxoBX24Bej//m9hgHJGL9bbkv3OlMKOabYHK8=;
 b=PBgD9ErVxj7O/Nci2d2eo+DcuB3qLm4b4OD/OSiZfqooNrU0HTeKtZvlRCLOWLPMmvoL7Y
 tKn4fW0ZqfvYq2ty5jpwZ3yvEPmKdK8PDARlv4NCloE27fIPDL9lAsOQNQaN0IqubEonVW
 y3zv1vVaOdWYABta+QsHyLy1+kJEgys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625227595;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Iu+v3CTxoBX24Bej//m9hgHJGL9bbkv3OlMKOabYHK8=;
 b=SNDO7MAiEihanpmhD9eZenvJEWoPDP3PDQI8isoWq51T0IDEpacFuHI2HiHEc2zl8J9N7d
 OlDXWkWcVh6fKDCw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 07F5111C84;
 Fri,  2 Jul 2021 12:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625227595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Iu+v3CTxoBX24Bej//m9hgHJGL9bbkv3OlMKOabYHK8=;
 b=PBgD9ErVxj7O/Nci2d2eo+DcuB3qLm4b4OD/OSiZfqooNrU0HTeKtZvlRCLOWLPMmvoL7Y
 tKn4fW0ZqfvYq2ty5jpwZ3yvEPmKdK8PDARlv4NCloE27fIPDL9lAsOQNQaN0IqubEonVW
 y3zv1vVaOdWYABta+QsHyLy1+kJEgys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625227595;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Iu+v3CTxoBX24Bej//m9hgHJGL9bbkv3OlMKOabYHK8=;
 b=SNDO7MAiEihanpmhD9eZenvJEWoPDP3PDQI8isoWq51T0IDEpacFuHI2HiHEc2zl8J9N7d
 OlDXWkWcVh6fKDCw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id bi2pAEsB32BIFgAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 02 Jul 2021 12:06:35 +0000
Date: Fri, 2 Jul 2021 13:40:59 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YN77SxjQ2tHeXJfp@yuki>
References: <20210701055208.715395-1-liwang@redhat.com> <YN7afAs3Mup5UbIf@yuki>
 <CAEemH2dJ4FYh-7-8C5na-uB1jg31mdV8wC+7w_DHG1463XudHA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dJ4FYh-7-8C5na-uB1jg31mdV8wC+7w_DHG1463XudHA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib: limit the size of tmpfs in LTP
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > > +
> > > +             if (!strcmp(tdev.fs_type, "tmpfs"))
> > > +                     tst_test->mnt_data = mnt_data;
> >
> > I guess that we are doing this in order to export the changes in the
> > mnt_data to the test, right?
> >
> > Is that needed for something or are you doing this just in a case that
> > somebody will use that?
> >
> 
> No, you probably mis-read this part.
> 
> In contrast, this is just to restore it to the original value,
> because we don't want to export the changed tst_test->mnt_data
> take effect on other filesystems.

I'm just asking why we are setting it in the first place?

If we do not change it there is no need to restore the value, so the
real question is, do we need to change the tst_test->mnt_data at all?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
