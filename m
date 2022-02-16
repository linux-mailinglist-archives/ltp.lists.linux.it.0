Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F924B8359
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Feb 2022 09:51:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6CD6B3CA072
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Feb 2022 09:51:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 23ECF3CA056
 for <ltp@lists.linux.it>; Wed, 16 Feb 2022 09:51:10 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9811B1A014E2
 for <ltp@lists.linux.it>; Wed, 16 Feb 2022 09:51:09 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 839971F383;
 Wed, 16 Feb 2022 08:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1645001468;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1aUsJjV8uKBEPydYJSoKgquFoGxx0vqTWsne6ev3MmE=;
 b=hQgMlByslhdHYHIpWfh2INJjgEt1vIkCCpO03E8mwwJVfWY12vnaTw13OlP3z5VFGxv1eW
 rFng3GXvNlolmw7Ri/knrYzsJC+ilIZ4ktXR+JEPgdeFyZLAj8ffSqjErruEa++JSi9xo3
 pNktLjFSyrqp0YmSrRKEMR6IQDEWDeM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1645001468;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1aUsJjV8uKBEPydYJSoKgquFoGxx0vqTWsne6ev3MmE=;
 b=NPS54TpGMggznGwW/MynQCuG+KtWQGA56LG1Gbdh/MVTRjw4Zrm29Pa3kS8v1pj4osAXAp
 3nzdVAIc5A/f+vDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5C37D13A7C;
 Wed, 16 Feb 2022 08:51:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RGUuFPy6DGKoWwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 16 Feb 2022 08:51:08 +0000
Date: Wed, 16 Feb 2022 09:51:06 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Bogdan Lezhepekov <blezhepekov@suse.de>
Message-ID: <Ygy6+t3MqaamDtlS@pevik>
References: <20220216074800.22621-1-blezhepekov@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220216074800.22621-1-blezhepekov@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] lib/safe_file_ops.c: Fix resource leak
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Bogdan,

> safe_file_scanf and safe_file_vprintf suffered
> from resource leak, as opened file descriptor
> was not closed in case of error.
I guess we don't care about closing file descriptor in both safe_file_scanf()
and safe_file_vprintf() because test exits due used tst_brkm_().

And we *do* care in file_printf() with err: label because we don't exit there
(tst_resm_() does not exit).

But instead, you could replace fopen() / fclose() which is followed by
tst_brkm_() by safe_fopen() / safe_fclose() (to shorten the code).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
