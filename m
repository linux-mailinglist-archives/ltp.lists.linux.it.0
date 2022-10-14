Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 659CE5FEB71
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Oct 2022 11:20:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 140383CADF2
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Oct 2022 11:20:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 78D343CADF2
 for <ltp@lists.linux.it>; Fri, 14 Oct 2022 11:20:07 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DE3051A002EA
 for <ltp@lists.linux.it>; Fri, 14 Oct 2022 11:20:06 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9273D21DF8;
 Fri, 14 Oct 2022 09:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1665739205;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n52SkV7Ax/wZ9k4CuOsll0s3NLfyMLNwu9OAT947O44=;
 b=CP9kBANq+4+Mhd40AMpt8RDO3fAh63HYMcSofsz+tM889I5shp6HfZrlMgj+WEdqMTZ608
 kWWt8X+CKbNGmSBXIxOcqc4F2BQ2hrmoFaAm+DGAU6W0Jjx35fICH5c6xbZ69vgSI4IU7H
 dna1qJnovE0fkwwlk9PjbAHny/0w6NQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1665739205;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n52SkV7Ax/wZ9k4CuOsll0s3NLfyMLNwu9OAT947O44=;
 b=m0ezkaHIiHEkpBfudad1EYP86KyCVWCTLpWbwliDD1mLjjGM3fzsCIJiVcdUqVKvho70w8
 Wzgmks5stlz6H4Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 03B2C13451;
 Fri, 14 Oct 2022 09:20:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aCP3OMQpSWPSGwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 14 Oct 2022 09:20:04 +0000
Date: Fri, 14 Oct 2022 11:20:02 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Palmer Dabbelt <palmer@rivosinc.com>
Message-ID: <Y0kpwmBvY6uxNXHC@pevik>
References: <20221013214638.30953-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221013214638.30953-1-palmer@rivosinc.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] MAINTAINERS: git://github -> https://github.com
 for linux-test-project
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
Cc: alexey.kodanev@oracle.com, vapier@gentoo.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, ltp@lists.linux.it,
 stanislav.kholmanskikh@oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> Github deprecated the git:// links about a year ago, so let's move to
> the https:// URLs instead.
Good point!

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
