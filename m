Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAa1FJJLd2msdwEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jan 2026 12:10:10 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5368782E
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jan 2026 12:10:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769425809; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=9cQZV8ohzE66tPjV6BiLvkaH10fxRtazGwMKMz582cY=;
 b=oC2lY904KurAko9zHO29bq+MscujcnERX+wXoIQyj42mYIITxwtgRSHE+o79gLd3ka1z3
 x7UFjdLaSGaX1azaU357pJI3ToIcdH4IurMet5ubRNe/keWdk3KYxQhI9hBhAn97eWjPEGz
 iobKwz9lxiEHHSKsxrNY5p1P6jgRMvA=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 510B93C2D9D
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jan 2026 12:10:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8290B3C01A4
 for <ltp@lists.linux.it>; Mon, 26 Jan 2026 12:10:05 +0100 (CET)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0136A600856
 for <ltp@lists.linux.it>; Mon, 26 Jan 2026 12:10:04 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b8715a4d9fdso537310466b.0
 for <ltp@lists.linux.it>; Mon, 26 Jan 2026 03:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1769425804; x=1770030604; darn=lists.linux.it;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eRm+MTWlpNycU2HYBWQYYB+RsCT33snembNC+n9ZFNU=;
 b=WApFDCw+WmGiX/IfJxSm92pFlQoOdftTb4RNegbrIvDjH5sPkKZ6YnzlENFqG8qOgO
 gmUFBAFjGwOFzrdpGmGe7l3ZOgh0G64ezi+ED+l4YQEoPZI1PBYYFZlH9RnIQAqdclkk
 qBNjTsEcKsdjcx4DzAaF4/ZXvmiVTdqdDLY7S7GOMqFvUiNXthCKpqM0pMutwpOXaveA
 ptxeH+2pENouzlU4qpriFBjvbO6vLcxR/2QmKCftELKgPyTfjWpzeKVTHGqEiZnrgj9l
 CIPWzfxSvLe6JhtNNrdtHpKvXUSRE/Y9RfHbrTragUMzlqibh8DKVlDRczO+vPMGHyaD
 pQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769425804; x=1770030604;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eRm+MTWlpNycU2HYBWQYYB+RsCT33snembNC+n9ZFNU=;
 b=rddOUsMPsTrcPeRqhp896EOAhu9vt7fryMJK0tkFO1duiWUBiqRpNzpkTxnPTL5W9V
 Tw402kBbP+mVyM18zhEtaQh2eiimk8mIZp9Bd81jOvRNYc9A1VQpsAnYBe6Lbpx6PqKT
 0wBtn2pnNd1AADK0qU8XuoTbcZKKR1ZaBqvFrcvCXwcOLeCZ+moVKdSuXhwnJ+Csptmn
 2iTtGZ1f4z6ObJS0aJ1xWb+ZjGk1VttfWC/ByBj81UyWnt0xBj+rS5I1RHcg070sCTiB
 2Ea/dkZl3w5J6psauQSzeR7+41MEZeEJlLeDjxvr79H2JAlT0xYZydQZoWACk9XniQYY
 SoNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMewZtEBLbjZflJbs1yPX+GTBv2RzAyIaqGgIsSSPPH3mc4xDhErizcHh79MTKgIgjf0c=@lists.linux.it
X-Gm-Message-State: AOJu0YzI5pqWjb6aJvretIZM6H8m6SHxxGcVe+hxPu/PWzM9MZc/7WkU
 yo/A9wBOAaM3LEY5ukt6IeJ8sWpiOtXkzLLz+fRA46N7R4krBXJvQwJ4D0IuTogiAus=
X-Gm-Gg: AZuq6aILi6xbKL8idVENEje069m60S0+FSJGFyD9wPyfyjRelwYrqE2e/rA+3C3v2Uq
 STTMIXkc6yvUwkd3YfsCARIt3q/GdoZb4sGupWT7N2wqEs4uwCJPQs3gopVQnpw5SgC2B+iQZIw
 XR2EZWUVoVrhhtbdm8zHBapPy8iJ7frmwd7CVG2ae4kSZZAwm+BG4IYqaAPUvIGYzv2fKH4IH/X
 NOPySt0Vt5xu9XFMG1lzGkp6OmmlsNFwWL9JDGcTTNZJcnzaYTAcW+CNK6ZnLfs4BxShoA360EX
 KpH6ALkxV2bCwa5vQrnnAAjpdjDpzn1asMhNjo8fpo2R6yY6DjSrCr73cspRgZ1M/mV8mhHkuv1
 YKhSmR2mab2wU063eO+VP3aREmtBuKtfH5/zDyFaonKsJWinUkPhe/GhXCEnknDbjkL4YjqOhQ/
 2NYlgqKPMFoM6d7BA1uCrpLzv/6A6obx+5bYxy0hl5eNThmUlPIIxZkIK1CfEeWBLrn5s4QLDGl
 dkd7Ts=
X-Received: by 2002:a17:907:3f18:b0:b88:7431:3942 with SMTP id
 a640c23a62f3a-b8d2e71276dmr317282766b.33.1769425804312; 
 Mon, 26 Jan 2026 03:10:04 -0800 (PST)
Received: from localhost
 (p200300ef2f1649001c626999955e52c8.dip0.t-ipconnect.de.
 [2003:ef:2f16:4900:1c62:6999:955e:52c8])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b6fc4c5sm627695466b.40.2026.01.26.03.10.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 03:10:03 -0800 (PST)
Mime-Version: 1.0
Date: Mon, 26 Jan 2026 12:10:02 +0100
Message-Id: <DFYH3K2R65UI.21K7LYNOY4KR8@suse.com>
To: "Petr Vorel" <pvorel@suse.cz>
X-Mailer: aerc 0.18.2
References: <20260123-fix_dio_sparse_slow-v1-1-65bd0dc0d52f@suse.com>
 <20260123175629.GA358728@pevik> <DFYDWAQTUSSA.PXU6P9MZPDRW@suse.com>
 <20260126100721.GA56703@pevik>
In-Reply-To: <20260126100721.GA56703@pevik>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] io: fix really slow dio_sparse on certain systems
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
Cc: Linux Test Project <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,suse.com:replyto,suse.com:email,suse.com:mid]
X-Rspamd-Queue-Id: DE5368782E
X-Rspamd-Action: no action

On Mon Jan 26, 2026 at 11:07 AM CET, Petr Vorel wrote:
> > Hi!
>
>
> > > LGTM. IMHO good for a release.
>
>
> > Should I merge it with your review tag? I also noticed that I forgot to
> > update the default value in the test options. I send v2, then we should
> > merge it if possible because this issue causes test to complete in 4
> > hours on certain systems.
>
> +1. Please Cc me, I'll add my RBT in v2.
>
> Kind regards,
> Petr


Sorry that was sent already without CC, you can find it in the ML.

-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
