Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B5F4095B7
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Sep 2021 16:46:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A897C3C9292
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Sep 2021 16:46:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 51D153C1DF5
 for <ltp@lists.linux.it>; Mon, 13 Sep 2021 16:46:36 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C44D31A01011
 for <ltp@lists.linux.it>; Mon, 13 Sep 2021 16:46:35 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F05E8219D4;
 Mon, 13 Sep 2021 14:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631544394;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3RkwO+PSe8RTHj50Rj3kDMxzgH7hDo6gm1A8pPri4Ig=;
 b=dEEqo66EUznCXoSEZ6DVuNpq/PtUirM2hQXi9ODyNHnq6TH4EHpctGBqxUURrFBwbnfv/l
 Sp9XQ6yUmjMb8Y0q9+ebX7slI/6SbvTvmjjnRN0iFjcozHEaEPkNFp9l0Piqk4SPf871JR
 stdEYapScUfKKo2nJFHiODyUjGBxe5E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631544394;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3RkwO+PSe8RTHj50Rj3kDMxzgH7hDo6gm1A8pPri4Ig=;
 b=2Dy6Kh9cqjWFZXMV/+OB1sNc61rIXtRbs3s4v2akNtYUVMx70PCyfF9w9DSjnuN8owyfRe
 w8V1eMCy0LhtRYBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A4FCC13AB9;
 Mon, 13 Sep 2021 14:46:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id B1/FJkpkP2GXbwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 13 Sep 2021 14:46:34 +0000
Date: Mon, 13 Sep 2021 16:46:33 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YT9kSW+oEBJVSZkL@pevik>
References: <20210909155126.2720-1-mdoucha@suse.cz>
 <20210909155126.2720-8-mdoucha@suse.cz>
 <287a9879ef8b3342cb88225e4e319733@suse.de>
 <3b789dc4-5232-a6d6-d864-7f75c5a0a030@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b789dc4-5232-a6d6-d864-7f75c5a0a030@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 8/8] syscalls/setresuid03: Convert to new API
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
Cc: pvorel <pvorel@suse.de>, ltp@lists.linux.it,
 Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On 09. 09. 21 18:32, pvorel wrote:
> >> -=A0=A0=A0 if (getpwnam("bin") =3D=3D NULL) {
> >> -=A0=A0=A0=A0=A0=A0=A0 tst_brkm(TBROK, NULL, "bin must be a valid user=
.");
> >> +=A0=A0=A0 if (TST_ERR !=3D tc->exp_errno) {
> > nit: checkpatch complains (TST_ERR should be second)

> checkpatch.pl wrongly assumes that TST_ERR is a constant.
Yep, variable named upper case is confusing for perl script.
Sorry for not detecting it myself. I suppose we should whitelist
TST_{ERR,PASS,RET} from these checks in our vendored checkpatch.pl.

Kind regards,
Petr

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
