Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E503A71CC
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 00:12:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ECA923C72B8
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 00:12:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 502183C0926
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 00:12:05 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A42E31400DA7
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 00:12:04 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AE8C0219CC;
 Mon, 14 Jun 2021 22:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623708723;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iEQEA5UOfcExwvPDUC9cHVyMi+mgysXGBzq8zzwfPUI=;
 b=vGjFZ22ViFt6izQDoY2YiBFdYJUm0MUEgP5kWoIzKy52RmhUxJ+c/PyN9By4I9KiGqmvX8
 bw0LFN7Fw4sFrSNJgPXaP0VVhANCSklJMJGUIsgkgPe/bn+icK7/SNRm0/g+g580D5ukDt
 45aV9dEdG7m6JMCCWbGlCJA1eDZb334=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623708723;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iEQEA5UOfcExwvPDUC9cHVyMi+mgysXGBzq8zzwfPUI=;
 b=tmzHT9QXGOmnfxmw2kU5OzeDFugFRvKx9uvmH9vWPlr5xmvnwDOSAwrkd3C6tBKI1tDSs4
 z/N7gZ5TcHN9kqBA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 749FE118DD;
 Mon, 14 Jun 2021 22:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623708723;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iEQEA5UOfcExwvPDUC9cHVyMi+mgysXGBzq8zzwfPUI=;
 b=vGjFZ22ViFt6izQDoY2YiBFdYJUm0MUEgP5kWoIzKy52RmhUxJ+c/PyN9By4I9KiGqmvX8
 bw0LFN7Fw4sFrSNJgPXaP0VVhANCSklJMJGUIsgkgPe/bn+icK7/SNRm0/g+g580D5ukDt
 45aV9dEdG7m6JMCCWbGlCJA1eDZb334=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623708723;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iEQEA5UOfcExwvPDUC9cHVyMi+mgysXGBzq8zzwfPUI=;
 b=tmzHT9QXGOmnfxmw2kU5OzeDFugFRvKx9uvmH9vWPlr5xmvnwDOSAwrkd3C6tBKI1tDSs4
 z/N7gZ5TcHN9kqBA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id bgJjGjPUx2COYQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 14 Jun 2021 22:12:03 +0000
Date: Tue, 15 Jun 2021 00:12:02 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YMfUMnBdpoUKwbhp@pevik>
References: <20210614094338.125870-1-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210614094338.125870-1-lkml@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] ssh-stress: Convert to new api
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

> From: Joerg Vehlow <joerg.vehlow@aox-tech.de>
LGTM.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
