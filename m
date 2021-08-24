Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5CD3F57B2
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 07:48:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 420A73C31E7
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 07:47:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 443F43C30D9
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 07:47:54 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2BD03200AC3
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 07:47:53 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4EB6C1FD74;
 Tue, 24 Aug 2021 05:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629784073;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7LWr1c0YwxwNrCrHHUQDSXSsJhGrymbvIV805ymzrAs=;
 b=dv5jCLjbtwQtzlB0w1lycqbtfqKa1RnoxRU4/hnyZ7NPGcf2fL/UiPYXKghVty2/NBF5rm
 hgKTcSHMGS8LrZvlctC5v+OHP6xnG62Y/E2N5Lo0pgIJtc+a+ZplwpK6dx9uq1NKoBeo9F
 z+zzsHhQYk1rN7rPn1idEBH9z80aTIw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629784073;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7LWr1c0YwxwNrCrHHUQDSXSsJhGrymbvIV805ymzrAs=;
 b=87o1vpGk1GTJNvNYXYM7ZkgaEHISi4r6CC/tJP+yOZo996Tm7PELpMh7RbYTjofs0su0Ks
 XnQ0+ugdYEiRTGBQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 0E26313942;
 Tue, 24 Aug 2021 05:47:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id geo/AQmIJGHlWgAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Tue, 24 Aug 2021 05:47:53 +0000
Date: Tue, 24 Aug 2021 07:47:51 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YSSIBzvto70b78th@pevik>
References: <20210812043807.3497492-1-lkml@jv-coder.de>
 <YR+LAmVDEUcZ51Wt@pevik>
 <3b97b712-f9d3-c5d1-66ce-0f98f5f1cb4f@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b97b712-f9d3-c5d1-66ce-0f98f5f1cb4f@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] shell: Add checkpoints api for new lib
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

> Hi Petr,

> On 8/20/2021 12:59 PM, Petr Vorel wrote:
> > Hi Joerg,

> > LGTM, good idea.

> > But I'd rename $LTP_IPC_PATH to $TST_IPC_PATH to follow conventions to new API
> > (There are also some LTP_* definitions in the legacy C API which were renamed as
> > TST_* in the new API).
> This would also require changing the C API, because the environment variable
> is used for communicating with it.
> I we want this, I guess it could be done in another changeset.
Ah, you right.


> > > +	if [ -n "$TST_NEEDS_CHECKPOINTS" -a -f "${LTP_IPC_PATH}" ]; then
> > nit (remove unnecessary {}):
> Could be changed while merging.
Sure.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
