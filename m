Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A903B3002
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 15:33:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 715B53C6F54
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 15:33:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E26F53C2021
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 15:33:11 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 301066005E7
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 15:33:10 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 84CA9219AB;
 Thu, 24 Jun 2021 13:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624541590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fQ0LO9a82+nmtVOJbQmXDGxsre0KZSin68DWwcDWVAI=;
 b=Dw2TfMWFzEvmnOC4vtG9K4IHeC3BSkDYvPrZ3Zn5By5TAMSwhh736ibpczZTx4gAvWRxHt
 bOKWjWfPtipUAoG9uJZ5d8StuOLXumDPnInKEXTIZ031ahM1Bdo8JffmXlBfE1TtjOvY5Z
 EY9KkA+GUdUxrrzz/geYbrJtrJM7qMo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624541590;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fQ0LO9a82+nmtVOJbQmXDGxsre0KZSin68DWwcDWVAI=;
 b=XMMaRryt8xI+plOpKPhwKy+26ElUKR+KWXsE7AGhSf+jhL9jiTaXuzGNoEr55qjK2kAzRp
 +Wf05ejnW0lFVIBA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 676DD11A97;
 Thu, 24 Jun 2021 13:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624541590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fQ0LO9a82+nmtVOJbQmXDGxsre0KZSin68DWwcDWVAI=;
 b=Dw2TfMWFzEvmnOC4vtG9K4IHeC3BSkDYvPrZ3Zn5By5TAMSwhh736ibpczZTx4gAvWRxHt
 bOKWjWfPtipUAoG9uJZ5d8StuOLXumDPnInKEXTIZ031ahM1Bdo8JffmXlBfE1TtjOvY5Z
 EY9KkA+GUdUxrrzz/geYbrJtrJM7qMo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624541590;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fQ0LO9a82+nmtVOJbQmXDGxsre0KZSin68DWwcDWVAI=;
 b=XMMaRryt8xI+plOpKPhwKy+26ElUKR+KWXsE7AGhSf+jhL9jiTaXuzGNoEr55qjK2kAzRp
 +Wf05ejnW0lFVIBA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id IjFoGJaJ1GB3XwAALh3uQQ
 (envelope-from <mdoucha@suse.cz>); Thu, 24 Jun 2021 13:33:10 +0000
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, ltp@lists.linux.it
References: <20210624132226.84611-1-krzysztof.kozlowski@canonical.com>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <018a369f-473b-524d-f81b-eb8be4df49bb@suse.cz>
Date: Thu, 24 Jun 2021 15:33:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624132226.84611-1-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: memutils: don't pollute entire system memory
 to avoid OoM
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 24. 06. 21 15:22, Krzysztof Kozlowski wrote:
> On big memory systems, e.g. 196 GB RAM machine, the ioctl_sg01 test was
> failing because of OoM killer during memory pollution:
> 
> ...
> 
> It seems leaving hard-coded 128 MB free memory works for small or medium
> systems, but for such bigger machine it creates significant memory
> pressure triggering the out of memory reaper.
> 
> The memory pressure usually is defined by ratio between free and total
> memory, so adjust the safety/spare memory similarly to keep always 0.5%
> of memory free.

Hi,
I've sent a similar patch for the same issue a while ago. It covers a
few more edge cases. See [1] for the discussion about it.

[1]
https://patchwork.ozlabs.org/project/ltp/patch/20210127115606.28985-1-mdoucha@suse.cz/

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
