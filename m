Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A35833F00D0
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 11:42:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0192B3C5620
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 11:42:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C08DC3C1822
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 11:42:52 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 09D011A0067D
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 11:42:51 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6A56422061;
 Wed, 18 Aug 2021 09:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629279771;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vx4kmRZ+FgHo5LXPbLObCeKZgI6e4d64nlONKwsUgR0=;
 b=VR6XR15sQvXG9NbY9ToP1wnkbwvZaWdkbtMCWSLShRY6fAU3uOOj1T7npSWGuLmhMKsmUE
 NaMcVGCGFVDFQ76eWJmQnhSY+X109bDfQoYs7Vg9ARRwnRup4EtFgeY8V9lwly1AliLxia
 MPeeRtjjagpJlU2ltDD9ntCP4A8gegg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629279771;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vx4kmRZ+FgHo5LXPbLObCeKZgI6e4d64nlONKwsUgR0=;
 b=SiWnbvGgJLofLCy2aHfnv8P+nXEplJTFz0w9U3IK4odrXKdJSrT9OPwlrZ0nVEQnY0gtg/
 HoRrtg89EvE0YODg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 1F8B7133D0;
 Wed, 18 Aug 2021 09:42:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id atVwBRvWHGHFHgAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 18 Aug 2021 09:42:51 +0000
Date: Wed, 18 Aug 2021 11:42:44 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YRzWFKFIBG2HlD3H@pevik>
References: <20210818091224.27578-1-pvorel@suse.cz>
 <20210818091224.27578-3-pvorel@suse.cz>
 <a695f1b3-ce44-b4b5-6a11-edd75df093fc@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a695f1b3-ce44-b4b5-6a11-edd75df093fc@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] binfmt_misc02.sh: Use "command -v" instead of
 "which"
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

Hi,

...
> > -	6) verify_binfmt_misc ":tmagic:M:0:This::$(which cat):" \
> > +	6) verify_binfmt_misc ":tmagic:M:0:This::$(type cat):" \
> >   			      "$TST_DATAROOT/file.magic" "0";;
> This does not match the description, you say you replace which with command,
> but actually you replaced it with type.
Good catch, thanks! Actually, this commit is wrong, it *must* use
"command -v".

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
