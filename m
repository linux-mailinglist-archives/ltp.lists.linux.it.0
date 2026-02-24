Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPKGDoJ7nWmAQAQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 11:20:50 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D85381853E9
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 11:20:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771928449; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=jJ3VxQ1AeZmlbhkBy6oq4K8HmQkCFppKAM2ezlDx0fA=;
 b=it+4+Nopw/UFmhH9nDj7aMh8ICtHU/qpZe4rcOk0UEyhQFyHjgby6EREoJGAjO/sD33Ij
 65AxLZHxRj/9U6ox+TyFcWJvlLtNeXCEj2Bwg+/kZ4mRjQe4Bi6wy8iddqSWT/9UYyhwkGF
 5Kz64Fp7O/7rHPTp3wUjQk5uCryY6lc=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 58E633D0F96
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 11:20:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F17423CA177
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 11:20:37 +0100 (CET)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2C1A1140013B
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 11:20:37 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4398913af88so252900f8f.2
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 02:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1771928436; x=1772533236; darn=lists.linux.it;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ai/6MEhpB9JUWZO0Vhxy9twP1TfXygro/bBf/6Lsq2o=;
 b=P1dxlo/HQwvapnk3VHeJ8dHI2EEJiAVEJZv/vLKVEuFbODrYIl5Ua+OjJC6xqNZNcE
 +nJvEbi0cdql9GSxeJ0gfLCIahNDyROVXgCRPhLw/ziDrtLhFVJnB6nHvCMlx//mrVK4
 AW5No9adpxekAdviQx1VTF37silF/SgP6cWP5L+c+qq7HByxJ+0/eYztR3/m+xkc3Np+
 fFPlXkjf89efbFMEbwBLwdkswKQMF/NUUzoSetVMkCSNj8FMjYvjnp87kGEjdXyvcTGW
 TIES/FRTYy+toSFnnZa5AbrctkmidqTg8ArjmirFYbB5NiDOfKv1JcrgOTAlXH4OelsK
 cAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771928436; x=1772533236;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ai/6MEhpB9JUWZO0Vhxy9twP1TfXygro/bBf/6Lsq2o=;
 b=aOGROjJpQHF1Eh07G4Ul8VidQuzG5cp43dRvVEi3/bOOJcM4CDPoGGear0FFF/6Idz
 xH4tMnVc7NZFJ06+zJCxnzI/HFGkCKpYLnttfsMzdBeQwrMSNzyQ7cFdqPAICu7BB36r
 MsY4/QxPLySIP4U/TtA1dfSnzcSysO7hjoem6hFCfz5I26x3A2a9VfDMavymSxSh+NED
 mRycJwpczRfvQDSuJ/n7EOMCSKkuQSZRbbMrFk1zYWVr6Qvc+mj2DJAbh45Xj3re/urh
 rSALwvxiwyKxahIFmhyLvh5NwikWX8zUhrn6Mqhd5FBl+uEKJ/OyYJsmG1Xbwmf+ZdkV
 aHcg==
X-Gm-Message-State: AOJu0YyeY0QJcIgK/ODGkJztm14UPY/I/++oDMWCtz53OaUkPDsOacf9
 RNMYNq3rN3KBNNlnKmE1wNP+su/HGTNtjp7CfBkRLS1sjfx/1bzK+yEL1OvdCf1yKAkLhxsfppQ
 7b8qI82Q=
X-Gm-Gg: ATEYQzychAzRKb4XY8B4l7S1IsqLkbMFZ+Dk0dvF4ixOv+e0Dw74U1baOA1R/ukF1KU
 tNu0IYfO6qQdT8jXLNHUXGrv+fxU/OVgyGP0gfBCKlOCskiZdSkfItFRHUgTAt5mu1mOsfgRZ5o
 91Xo0gVpWhFBANsSyJiKhZ6MFrxFkJHkIkmUiFRR1xzKz8nrv3sw3CIabXZC/lP17ANgFicPwUv
 QNVamf3pnxMsSmijUrxPxDNVBsUV0KcljgMTim5DKJ/weq/Y5pZ2WXbwsB+4DTNs/Cs0n/0bAXg
 OfOq1F+qPlWXUGkPEVQ6aA9JqFtBQjCZF3oEg/3KOWmvFs+rrgJi5j78C6ZX493I09CHqm7QVUw
 T/46ti3IWnR/6mUcbUpFhDo/IzB5nVV0XSNQK056DN4wQtv1UkvF3g7ISf9iBU2roPFrsyJCAcf
 E1hJezEsyqUeDv8KOpkVglLNs+Ag26dRRrVjwWc45o5+v4m0MaSOVIAJBjNjgaD0wMUWTCVn+gz
 1xXEeDewhHB0R11fkU=
X-Received: by 2002:a05:6000:420c:b0:437:6963:a115 with SMTP id
 ffacd0b85a97d-4396f18534emr19464528f8f.42.1771928436460; 
 Tue, 24 Feb 2026 02:20:36 -0800 (PST)
Received: from localhost
 (p200300ef2f4fc9009ff26ae1d4042002.dip0.t-ipconnect.de.
 [2003:ef:2f4f:c900:9ff2:6ae1:d404:2002])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d4c626sm28610185f8f.28.2026.02.24.02.20.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 02:20:36 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 24 Feb 2026 11:20:35 +0100
Message-Id: <DGN47HRFMU73.6AKMTBA60R3K@suse.com>
To: "Jan Polensky" <japo@linux.ibm.com>, <chrubis@suse.cz>, <pvorel@suse.cz>
X-Mailer: aerc 0.18.2
References: <20260220173928.57467-1-japo@linux.ibm.com>
In-Reply-To: <20260220173928.57467-1-japo@linux.ibm.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3 1/1] [STAGING] ioctl_pidfd06: Select expected
 errno for PIDFD_GET_INFO across pidns
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
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,lists.linux.it:dkim,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: D85381853E9
X-Rspamd-Action: no action

LGTM

Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>


-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
