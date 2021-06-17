Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0F03AAAF7
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 07:19:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1179D3C30F5
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 07:19:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2F8BB3C2E0B
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 07:18:59 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 94A46600199
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 07:18:58 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F40B91FDB1;
 Thu, 17 Jun 2021 05:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623907138;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MakQijc2si/p3G098UTSXJvbtHIKIq2RGDX1rzCjeC4=;
 b=d2+ZL8UNsExkc9vVCXf9URIZzUIHAo/n4fQYFwsCALkCP6zdTNtBfnf74OcV97bIZ1eGgH
 n5JaEltaXqQmutiq/MEyv2lku6PFtK+CCATxB0zrFeVG4wMXXk9lwXY2VCfDSQaW6uOSiA
 0MxVGZ9kzh0va9Mbug1SaTz0y/srlnc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623907138;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MakQijc2si/p3G098UTSXJvbtHIKIq2RGDX1rzCjeC4=;
 b=EAVBflnRSw+Zy2OI9qcGQo+EjNeqCJqoLlL4MS5VBGoHGCrYGN4DnjBlznu/006AFAXH7a
 8BTRqRLTdK1QNhBw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id B6E1A11A98;
 Thu, 17 Jun 2021 05:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623907137;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MakQijc2si/p3G098UTSXJvbtHIKIq2RGDX1rzCjeC4=;
 b=Q6NvHgSbTk4Iin/5hKbLvMhNcO4wdVVzJYkBGvvkitfXk5HfHxkfOwiiUv7hLWjhONzoKk
 g5EM30Af8+B1V45ChTHXfYX2dUC49iY7y8BpHM390XOrBsSY0x6mfVoJXL/zcfgz2NZo8J
 VP01gz0mygSZBo1PFWoDUqL+vk0NJ8k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623907137;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MakQijc2si/p3G098UTSXJvbtHIKIq2RGDX1rzCjeC4=;
 b=YBX3F8cAFKRP63A2eYejMRoBgXx9juFImuK0jUavv+V1jUkejr9tLDfKwnNFlcCk5uuRSF
 CWUBkzZoUreXyKCw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id uchSKkHbymCgSwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Thu, 17 Jun 2021 05:18:57 +0000
Date: Thu, 17 Jun 2021 07:18:56 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YMrbQPcfS9xFOBpO@pevik>
References: <20210616081856.3026223-1-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210616081856.3026223-1-lkml@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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

merged! Thanks both for your time.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
