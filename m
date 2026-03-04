Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDOOEbhQqGnUtAAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 16:33:12 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E1480202C75
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 16:33:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772638391; h=message-id :
 to : in-reply-to : date : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : mime-version : content-type : content-transfer-encoding :
 sender : from; bh=httOYjA/6PknMNAGC/0lxSZIHt1k/yS/B0kVYbb+frA=;
 b=NVUvtg9StcfZvDoA+bqzc5rvMTotf1kj+puCTPRnupB+sV5PPUxhLhA7BS1mSVQHhBU+f
 Hvir2WJU97/na/y2jaqf8UmVPbn0hDHjl9FmmVUHPMTlTQOAFeaPon78S2i9Av8eclVoHqD
 CccrwLmjvhqTKTvWzA80IVA8CWMOp7g=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 977663CAF08
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2026 16:33:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 175AC3CAF08
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 16:32:58 +0100 (CET)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A78D12001DF
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 16:32:58 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4837634de51so29908805e9.1
 for <ltp@lists.linux.it>; Wed, 04 Mar 2026 07:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1772638378; x=1773243178; darn=lists.linux.it;
 h=date:content-transfer-encoding:subject:in-reply-to:to:from
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=HIZoZYrDdiNCtMIKI9ZJ/TyRATKxBKC4nSsDLT6ESJQ=;
 b=e6IEJHXTcxuhrb2eGiuohqA8DEMC8+0ivGs1vtHZOl08lTB+brioNgalnXvZgBzq/b
 BhPrmCzo1VTy+bEcOKBd1qzzRb8OydfPYrXGWHHivEGWUy5/kc3VqN3b61VniApX4kRb
 2wfS6LDfWDBLHW1UtWL9gRcf1ESF8JVX97kGlwvWxp0sIFILx8elkA+t3JS7vlatEchM
 PX0PSymJpjBzno7AhwyCtQ0WYtJONn2VXkZZZJe7+8Br42py4iyQN/aHN8Bl6x1epEAv
 HMQYL0n991rRnsbhpWR5F1qTbx8CJTUJu5sHaSMDYI2cqS/Lp8UEntYbna4sxNPGU5e9
 RO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772638378; x=1773243178;
 h=date:content-transfer-encoding:subject:in-reply-to:to:from
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HIZoZYrDdiNCtMIKI9ZJ/TyRATKxBKC4nSsDLT6ESJQ=;
 b=jufrHUfGciWfef1GEePi44xzzOKCpg7aymzMaioz0nbRK/8RNi2BFA0ODc8w7wG1Iv
 3ErSOFPlbUvZ2fwpsGt0tPjMmRivANU6WZGfnoKeC7vhsjoesrcqM5iqxZW7hZAA9fZd
 W++oUxIeTaua4HKVue0lFT6+ySPXGkBOutiQMkYiMBQBBtm+pBeMa2sbxoKDMB48Cf3F
 qwkoEz0y6amhGrpchB+jzlO66vZEyrI7NglTFxOZap7v2qKHTcDbo5gt0n43OQBwhBtb
 zTcDaVkoWo6WFIJfnCjVjFoICFc69E6G//+ANpcW1M9Rq+4Xi5sYP3Liyd/E8ODIo1lV
 WgGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV78L9PKWDuHdNbqfc2z1/FBwtluj33VE2YOU6Md4JMzw+9gnVL3+HghdNlR9IVwde8ePk=@lists.linux.it
X-Gm-Message-State: AOJu0YwTCCOM1tbzD6yEnKDucSx+w1NxnPVSWPPeynpj/a4Xf1SR/Oa+
 1eYsN0ot57v459ui74d6ZNBZl2PbtoHEzoHTz3w4T7f1F4PdHyKHpaGeAR61DNeYm5g=
X-Gm-Gg: ATEYQzwXAXxjCIsCMdwwogjhg1aXuYWsSOqOgdUK1hrFm/VhV4ImLfMPdyv7SxYeUIg
 7UqSHSqzVJ3y+H0rug/QIuFqEGax/2xFTqJ5+A9zNZJNHQQI6TIsSG+p0EUF6CyshPFV2mUs2mW
 y6w+jDtM/a00ClMbLYFftBqN1ztJMrPW8D/hhCq6NbUpU1b7gjgCS0qPL5H1eEo9CjkWq2UBR6u
 oAjwK2v2jNVajVhreUaSEUT3NBfRLuAMDS78xXqXrkEJ4Yo/5DSg/u9aaE/8srW/VoM7wx/fz2D
 fXuaS6yQ/vY7t7khPaFbFxl262jyT3Ef+IndO063hCPMmaHyB9f7JVehY9oTYCZvM3ZhjxH6kjL
 FlvlmZiElWjKv/8r6myXLcbPzzIoBbK4MDb9N7MjyHAb7luMUoI/dtoSXBUS4JnOpUTQIb3h/Su
 fhy+BlIuLYWgxiI27Mfjxvdz8GshlZ6bhcsuwothvq
X-Received: by 2002:a05:600c:46cf:b0:475:de12:d3b5 with SMTP id
 5b1f17b1804b1-485198cb8d3mr37398475e9.34.1772638377955; 
 Wed, 04 Mar 2026 07:32:57 -0800 (PST)
Received: from localhost.localdomain ([88.128.90.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851c907a08sm1313835e9.0.2026.03.04.07.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 07:32:57 -0800 (PST)
Message-ID: <69a850a9.050a0220.6244d.ff52@mx.google.com>
To: "Cyril Hrubis" <chrubis@suse.cz>, ltp@lists.linux.it
In-Reply-To: <20260304141236.9080-3-chrubis@suse.cz>
Date: Wed, 04 Mar 2026 15:32:56 +0000
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 2/3] syscalls: sysinfo01: Rewrite
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Queue-Id: E1480202C75
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:rdns,picard.linux.it:helo,suse.com:replyto,suse.com:email,linux.it:url,lists.linux.it:dkim,mx.google.com:mid]
X-Rspamd-Action: no action

> +	totalram_kb = ((unsigned long long)sys_buf->totalram * sys_buf->mem_unit) / 1024;
> +	totalswap_kb = ((unsigned long long)sys_buf->totalswap * sys_buf->mem_unit) / 1024;

This 1024 can change into TST_KB also.

--
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
