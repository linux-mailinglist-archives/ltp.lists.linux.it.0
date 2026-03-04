Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yARIGEhQqGmztAAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 16:31:20 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0A1202B93
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 16:31:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772638279; h=message-id :
 to : in-reply-to : date : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : mime-version : content-type : content-transfer-encoding :
 sender : from; bh=RWBj789HCSiUrKB8R4V2KKfYWo3b/dWdN6e1tu5kcT0=;
 b=JTyvUI015m7WceQdn7sf2qusJVCiJGMhqQ2knq8M0LU3rzxIPkVxYsE+oI884exOxr2N8
 TUCwopv5aqW7I8l0uZVgvQmk2SKIdc+joNl5wjZrm62VzFGTDk+HR1Eh0c88odWsC1Itla9
 Pt1kMNmNKo4uwiH4qp9FjWiKNcFaWpY=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9DA2F3DC7CE
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2026 16:31:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C2ACA3CAF08
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 16:31:07 +0100 (CET)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3CD511400108
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 16:31:07 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-483703e4b08so67152765e9.1
 for <ltp@lists.linux.it>; Wed, 04 Mar 2026 07:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1772638266; x=1773243066; darn=lists.linux.it;
 h=date:content-transfer-encoding:subject:in-reply-to:to:from
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=nIYZV4wIwN0c0BMAf0MMCsM9Xjm5KWqPcbqWD98uGZ0=;
 b=Gm6+35bbYjrP4Rnc2fAz+BPB9jYGTJ/8VOaxO0e1VYsASCvOVp1y+0r++LYfGTXt4d
 VGlZJMSya1FA/jQZW120D65hdARALn7j4lvZ8+wKsy9M72KBakfOZvMaYg9bOqrABzRx
 Ei59yh8AAZTiNZK6DuHhYIbuWqDkQ26wQqQPhOhjKW7k4Z9s/XpzPhcT2EYZqDkc8soB
 lkVlWNMuPcY4dFhu0gYzOujxjMmAuBdMC/mS4B8SaWX0gNnA0hXTKS7dg3yNOLtO4AQW
 esChIzwZFa1PyOVfJMtxqhqd9chv1CxMITtLb/Ch0tmQDGIoPLaZTXmc9ZklbzkHe+QA
 t62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772638266; x=1773243066;
 h=date:content-transfer-encoding:subject:in-reply-to:to:from
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nIYZV4wIwN0c0BMAf0MMCsM9Xjm5KWqPcbqWD98uGZ0=;
 b=J1fqigf8D3E5iIPBVw/l5fqLaIHgk1eva/rg0yjWM75dXi7bNrM9Tcb+wb5Ka/mDho
 nb4FH/I7CLxGe2ToUHiunkPUd+5y4dzMVD4rvY5wGCBIspilKvY7DAERyUiXSrPUIzeN
 LJPDpLINN1a/3vJeRDGT/gULcdO4dW1GqyeazOsgZVwcKESQSsBFCtOmk+7Hzg4/WXHA
 JLtXPzHuvGBWP3Bl2gdqo/KIM2ZFjsNPEynck/MgCLJET5Tzd2j44AkWTV2TSXstmidg
 n2FeldBHJNjHJSNafbJQh/Ft4asBR7/Im6eDhFEA1h1gAYuDglBdkJ/5xCQevAiWW/8u
 5Npg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWumlvpxnOypPrhAoDiTspqYyALTT+INX4p1q4TR2pEE752VsPoBZm1zRPh8oucuUvU0ow=@lists.linux.it
X-Gm-Message-State: AOJu0YzjCZTLTsK+HVPRb8QuB/zl2IdgcZ1ldYTI1MLrgbU556DRiqYG
 sP0J+WMZTWthrzVryyEP1INyeV4PvukuZVg7VfPNV2wHfSpo12tOFlPcdvTfIDWmZ+o=
X-Gm-Gg: ATEYQzyawedRgVNKST0yocGeKvlstK/+t3tnOiqADHIpgcXCUqoAGIUcHFRTgDb4Bqn
 0BBSXO7iZQKn1nJqQ+aBevmbPG4T2X2uIxIfXXVK0vKBESV5RWQRR2hYhrwyPTiMZQbcx27DviT
 0YcqWzKYorg3xxHY4rbz6WE8QYbjfYDsEnX3SZPSIzHkoAfw2Mxl8jMUpdLWM4Pr5Y1NxH9KyxD
 Hqigisp4gK53QChmBwmys+otqbiNmpdKsk9npF5LBficDPGjZVdq03jsWXzEXkgNjRriAIQYCYj
 JCtMBQpHYAVCCi32WCfHM1EAtKME64sSzm2KRaYFeooBVmYI0JOSCx6GVAkNXkkMzUW1KftpnsH
 nAdhrI3e3mN9sTy+FUcO3VCX+bP16EfWzcztemwxmmGO2mzAhH6keDN9TxnruqkCPv9eyxwTz6V
 CJIYyMegtJ7Cz5q/PVAlSp1AypK78b06Ybq3US8bDJ
X-Received: by 2002:a05:600c:c0c6:b0:483:722c:a3d1 with SMTP id
 5b1f17b1804b1-48513ea5802mr91797695e9.16.1772638266442; 
 Wed, 04 Mar 2026 07:31:06 -0800 (PST)
Received: from localhost.localdomain ([88.128.90.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851881224csm57021285e9.13.2026.03.04.07.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 07:31:05 -0800 (PST)
Message-ID: <69a85039.050a0220.245295.5601@mx.google.com>
To: "Cyril Hrubis" <chrubis@suse.cz>, ltp@lists.linux.it
In-Reply-To: <20260304141236.9080-4-chrubis@suse.cz>
Date: Wed, 04 Mar 2026 15:31:05 +0000
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 3/3] syscalls: sysinfo02: Convert to the new
 library
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
X-Rspamd-Queue-Id: 0B0A1202B93
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:replyto,suse.com:email,picard.linux.it:rdns,picard.linux.it:helo,linux.it:url,mx.google.com:mid,lists.linux.it:dkim]
X-Rspamd-Action: no action

Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>

--
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
