Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A81BC3C4396
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 07:49:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 703BA3C673A
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 07:49:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 82A843C1DD9
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 07:49:51 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id BD299600650
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 07:49:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DF2321FF3E;
 Mon, 12 Jul 2021 05:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626068989;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XQ6SSQnTQcmqRr6qWRfXNANGGUttC4Urp/GT8mi36HI=;
 b=vlkNcgMpScvbUDspHSNBjKn6GSnRCkXcePM+oKQ92d41Tk0i+9U4GnzQlj0WHtV6E26bJS
 /8SumvA2gFh+JZtRIMIjzRMGMGIqhG43DxJUm2OBRv6N42F99uo/s4fYsOxLgJIM6aYO/e
 ixCct6fooolA/3qlOUNqcqrFMawbrrI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626068989;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XQ6SSQnTQcmqRr6qWRfXNANGGUttC4Urp/GT8mi36HI=;
 b=5W75Mt7Nva2qekPMraK4GSmJeXHcU/WxPMmH3D/zxnI9YCKL/gJy4uZ4B5KiEmc7ngsDaK
 O1ys9tzw55xvCpBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A85DF1377D;
 Mon, 12 Jul 2021 05:49:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZnwyJ/3X62DbawAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 12 Jul 2021 05:49:49 +0000
Date: Mon, 12 Jul 2021 07:49:50 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YOvX/tczl7Duu+6L@pevik>
References: <20210709140143.9180-1-pvorel@suse.cz>
 <CAEemH2fB5VakafKhTgcOsvwK6Q50AJ3WcpRY2fSLfhB86b03Nw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2fB5VakafKhTgcOsvwK6Q50AJ3WcpRY2fSLfhB86b03Nw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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

Hi Li,
> On Fri, Jul 9, 2021 at 10:01 PM Petr Vorel <pvorel@suse.cz> wrote:

> > From: Petr Vorel <petr.vorel@gmail.com>

> > in tst_ipaddr_un(). This is required to fix problem on dash, which
> > (unlike bash and busybox ash implementation) takes value of previously
> > defined variable, i.e.  guarding with local does not work:

> > $ foo=ee; bar() { local foo; echo "foo: '$foo'"; }; bar
> > foo: 'ee'


> I'm thinking maybe we should avoid defining the same name
> variables like that. But anyway, your fix should be worked.

> Reviewed-by: Li Wang <liwang@redhat.com>

Thanks for a review!
It's a bit strange to add '=' only single variable, maybe I should have rename
the variable.

Paranoid approach would be to add '=' to any variable which is assigned only on
some circumstance or even any variable which is not assigned to any value.
But we probably don't want to do it.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
