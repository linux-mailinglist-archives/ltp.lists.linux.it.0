Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E49143A98F1
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 13:16:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8CA613C8900
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 13:16:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0AD213C2E09
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 13:16:53 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 835FD600D31
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 13:16:53 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C250C21A1E;
 Wed, 16 Jun 2021 11:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623842212;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pJUz95rLCd9NJZjDj06c0MJt2vO9b52sdHHJCSHuBRk=;
 b=Dxv51UqklBZraNVfAOlsrvFSA4r6A2k8Kd6tbpm2UV/de8lxKiwpdGHgnRJ3uOtfdqxLC7
 OhraaaorlsxtxZ/HpLSzeOtJQ1iHorTQJkMWEe38oz9AES/7w47nPvV1t7c+ziTMW8b+uD
 v2B3XYaDtyubP/JJE+n1LdKnECNv73E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623842212;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pJUz95rLCd9NJZjDj06c0MJt2vO9b52sdHHJCSHuBRk=;
 b=Ceoug53D9lHRDiYkOLjHCVbBRhJ8oAQ/Px1fyaF+YycoUa6nNWo9kZS6iQlVkb/f3G7jtt
 99hNvvQ+PSngBvDg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 828FA118DD;
 Wed, 16 Jun 2021 11:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623842212;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pJUz95rLCd9NJZjDj06c0MJt2vO9b52sdHHJCSHuBRk=;
 b=Dxv51UqklBZraNVfAOlsrvFSA4r6A2k8Kd6tbpm2UV/de8lxKiwpdGHgnRJ3uOtfdqxLC7
 OhraaaorlsxtxZ/HpLSzeOtJQ1iHorTQJkMWEe38oz9AES/7w47nPvV1t7c+ziTMW8b+uD
 v2B3XYaDtyubP/JJE+n1LdKnECNv73E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623842212;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pJUz95rLCd9NJZjDj06c0MJt2vO9b52sdHHJCSHuBRk=;
 b=Ceoug53D9lHRDiYkOLjHCVbBRhJ8oAQ/Px1fyaF+YycoUa6nNWo9kZS6iQlVkb/f3G7jtt
 99hNvvQ+PSngBvDg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id +kklHqTdyWA6aQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 16 Jun 2021 11:16:52 +0000
Date: Wed, 16 Jun 2021 13:16:51 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YMndo2/ts98PpdCn@pevik>
References: <20210616081856.3026223-1-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210616081856.3026223-1-lkml@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] ssh-stress: Convert to new api
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

Hi Joerg, Alexey,

> Apart from pure conversion:
>  - Use "StrictModes no" in ssh config, to get rid of
>    access permission problems; All part of the path of the
>    authorized_keys file must not be writeable by anyone but the owner.
>    This allows writing the file to the default temp directory
>  - Moved all rhost scripts into ssh-stress.sh

> Changes in v3:
> - use pkill instead of ps | awk | xargs
> - Changed test descriptions slightly
>   * include actual ip version
>   * dropped "for a long time", the tests do not run
>     for a long time with the default config
> - Use netstress -B and ssh -f for background processes
>   This implies using pgrep to get the pids of these processes.

LGTM.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
