Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A81397082
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:43:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B39B63C8016
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:43:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 81CFD3C1CB7
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:43:25 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E6FF11400DC5
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:43:24 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 593401FD3A;
 Tue,  1 Jun 2021 09:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622540604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+z3+zDA/KM62Bt1RIpxTuP6TbShRbtw1Hv+eaPUpsBo=;
 b=hvvdG2yL3rz3ntLJac8P89aU4WJehzktP8vukCv5n4JAexgIqxRJRT63RW0KR6CiZNZuoM
 ZZ1u6+hkaWbXRqGysaYY3nbtNC1UFpuElf/RMYtwt5ceCsTIuN1AkmHqhBFfujCMYLOCUn
 r7GtBqWBNOFYtenftwag+mQKlP+X7Cg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622540604;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+z3+zDA/KM62Bt1RIpxTuP6TbShRbtw1Hv+eaPUpsBo=;
 b=oibOg2wAdLWMcSYrDN6HEe/YOVM6YwCLerYIWYpLEPz6+OLo3PDF0v3lIrs2U92Z4MMDSN
 knFdclijMspcIBBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 3C6FA118DD;
 Tue,  1 Jun 2021 09:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622540604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+z3+zDA/KM62Bt1RIpxTuP6TbShRbtw1Hv+eaPUpsBo=;
 b=hvvdG2yL3rz3ntLJac8P89aU4WJehzktP8vukCv5n4JAexgIqxRJRT63RW0KR6CiZNZuoM
 ZZ1u6+hkaWbXRqGysaYY3nbtNC1UFpuElf/RMYtwt5ceCsTIuN1AkmHqhBFfujCMYLOCUn
 r7GtBqWBNOFYtenftwag+mQKlP+X7Cg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622540604;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+z3+zDA/KM62Bt1RIpxTuP6TbShRbtw1Hv+eaPUpsBo=;
 b=oibOg2wAdLWMcSYrDN6HEe/YOVM6YwCLerYIWYpLEPz6+OLo3PDF0v3lIrs2U92Z4MMDSN
 knFdclijMspcIBBQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 0POYDTwBtmDGcgAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Tue, 01 Jun 2021 09:43:24 +0000
Date: Tue, 1 Jun 2021 11:17:31 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YLX7K7oPmSSqXfxO@yuki>
References: <20210531165052.8731-1-pvorel@suse.cz>
 <20210531165052.8731-3-pvorel@suse.cz> <YLX5vtHAFVWUmjmU@yuki>
 <YLYAg9oM0XL4Q0/I@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLYAg9oM0XL4Q0/I@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] CI: Rename travis script directory
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
Cc: ltp@lists.linux.it, Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I'm sorry, didn't read carefully that the first ack isn't for whole patchset,
> thus merged whole patchset with your ack.

The rest looks good as well and we really need working CI so no
problem...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
