Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C046F4547ED
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Nov 2021 15:00:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8D4653C8819
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Nov 2021 15:00:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5673B3C87F6
 for <ltp@lists.linux.it>; Wed, 17 Nov 2021 15:00:30 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D31581A014F9
 for <ltp@lists.linux.it>; Wed, 17 Nov 2021 15:00:29 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id D6B8E212C7;
 Wed, 17 Nov 2021 14:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637157628;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KT/SKDotJsuzJivdchNowopt/y7Dtf5xHx8bN37nfpM=;
 b=ZHjSu2mpNJkx9DSg4TpOi9z5etkpKSOjBOX3ND+oXuxqnuK8HSJuHssZuRg5PKn955dn9H
 vwyrli998j6adRXZNOmDM2pO5cEb7CdJ6GiPjEKa8Fv5cGfXtWfrTuLYI8KKH2H9qBoJhx
 OhqmQ0fiWMi6Ibz7h9un92lh1XaGwsc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637157628;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KT/SKDotJsuzJivdchNowopt/y7Dtf5xHx8bN37nfpM=;
 b=wEz/weAXwNOH75wQZU9WxJdWZS5fH8OY8dPLTmuhLSI2Psh0bw5I3WC1OD15pl1pWSiPh9
 sSAoIBQECMokEBDg==
Received: from g78 (rpalethorpe.udp.ovpn1.nue.suse.de [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id A166AA3B85;
 Wed, 17 Nov 2021 14:00:28 +0000 (UTC)
References: <20211117070708.2174932-1-liwang@redhat.com>
 <20211117070708.2174932-3-liwang@redhat.com> <87v90r9idn.fsf@suse.de>
 <CAEemH2cXOBqOObhWAoqeS4Xk5MVXyFMfmS79pxqfXJbd+TW8Qg@mail.gmail.com>
User-agent: mu4e 1.6.9; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
Date: Wed, 17 Nov 2021 13:58:51 +0000
In-reply-to: <CAEemH2cXOBqOObhWAoqeS4Xk5MVXyFMfmS79pxqfXJbd+TW8Qg@mail.gmail.com>
Message-ID: <87r1beanly.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 3/3] max_map_count: replace ifdefs by tst_arch
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
Reply-To: rpalethorpe@suse.de
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Li,

Li Wang <liwang@redhat.com> writes:

> Hi Richard,
>
>  
>  > +     case TST_IA64:
>  > +             /* On ia64, the vdso is not a proper mapping */
>  > +             if (!strcmp(buf, "[vdso]"))
>  > +                     return true;
>  > +             break;
>  > +     case TST_ARM:
>  > +             /* Skip it when run it in aarch64 */
>
>  This should not be possible. If TST_ARM is set then how can we be on
>  aarch64? We also have TST_AARCH64.
>
> Not exactly, I was thinking like this before, but as Cyril point that there is
> a possible 32bit ARM binary runs on 64bit aarch64 kernel.
>
> https://lists.linux.it/pipermail/ltp/2021-November/025925.html

Thanks

Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
