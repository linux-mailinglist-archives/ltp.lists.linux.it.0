Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFCmLPMKoWmJpwQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Feb 2026 04:09:39 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EAF1B2305
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Feb 2026 04:09:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772161778; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=19Swd9zvC75ruO7IJMWHBYVttmRIBMStSNllZ5qeqkw=;
 b=aVfCBeqQTPRs8hLZh93jMLtF4k/l5OdYTlrPEMGL+87Jm2eVHpWkSiETErijc78X772Wq
 mVr0uBvnib0gDCD6+tSTXKxRTS0g2aBuLr3KU4c7s7hvkEW8ZZ6wgI1aPwgUaUKiBS/P38m
 pGs9cq2lXeQvAX4on4P++v3FSNedDQo=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D9FF33CC6E4
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Feb 2026 04:09:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3878C3C1844
 for <ltp@lists.linux.it>; Fri, 27 Feb 2026 04:09:35 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 619D5600132
 for <ltp@lists.linux.it>; Fri, 27 Feb 2026 04:09:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772161773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JCEk9raIysVJTe5ZNy5MqPIzcO0Tx6ILf6ituIEagE8=;
 b=Jrmnkfq8nioV/sfcV0D5ZfPojEtIpCat9xpICxD8k1eNEb6k/ZqiXzGfn2RNUJh7fDgNsE
 w5mwFWoItxtPZN24udVBc6I9NCz6N2Abt82eWQGI9e1FDjZzQrRG253IJnukhyxOk0jn+6
 4rIKlx320QgW59jC3CUgnNTGRd59uso=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-jtoc_w_DPF-j_4Hv0voLgA-1; Thu, 26 Feb 2026 22:09:31 -0500
X-MC-Unique: jtoc_w_DPF-j_4Hv0voLgA-1
X-Mimecast-MFC-AGG-ID: jtoc_w_DPF-j_4Hv0voLgA_1772161770
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-82739e0f53fso5037066b3a.1
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 19:09:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772161770; x=1772766570;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JCEk9raIysVJTe5ZNy5MqPIzcO0Tx6ILf6ituIEagE8=;
 b=Lh+JkiI4wWUJ8SbWiCKefL8F/2XKEfxlJib/bGFxGlxYjDevlu+CL0tcwG9VsjebCB
 KkPoP8+l8W83Gb9Wx08UVMKiCA8StBd21g8M5ye4hv3K7E7cgf+zzDhyYEbeWEAP//Pk
 dNuTBbV0azb4SvvN84rSBkUcQigsjYfVqgq8uPIWTfI946yyxpLk0GJRWCBEc2E8RBfV
 d5Ypn/UdhMtXWA61NyX7YOyDMRVcoyAeGAy5akprHmwxDj2Qh91uDwBPpFRql7xLUm7I
 S0nxpjGaEjnXhA90elsp0rWbjPc/Gsb/CboWEi8FbVLYeLoVxLESETahppfGk6bdokJN
 WSBQ==
X-Gm-Message-State: AOJu0YxrFxwfxzoyXihF/uy9aDYq8O023MYRK0QIOo3dKkeVxL29sPMk
 VS7qEuF1CKv8tH6STcjfqquZbWn7qRNs/jhetySmCp+VdIgW4UkAGZR1TvN5Ssb0ABvEj8lXSGk
 XgDYE9PatBUxsw4l0hlQZJuSboGb9WD4s6FeKsX0ek28gu6R9mnOxHWNiP85/
X-Gm-Gg: ATEYQzxxqUs5bD+IDOslml4jNB+sY5iqpwA4kywHprFO4nipaoQc45WdJ5WSZ1CZirc
 5GDbgPymyV7d6dIgvu0T30WnjLwC601tseZ1fDutKj6iSpe/eHT6xR2etimD2cCX+ip/JMfrmDZ
 RMMsz5fNHcWe1Es6BA2K6tygAeb4lUonGmIGKDokP04hm55zgIXHpvpHIcwXxTUY460Q92FksuQ
 U4FL8cLAHK30HRtOx0XGqCqCGXPjswu4VmguM2ocpO3azZHLcUcEssh9Me1tdPOdIhZhfhGkyDU
 ceXwfrPr/ALYvUWxDa821mRavo7lFJCwwbhUwrL6LT3S0V0nIDJW5dNEqybUFz07RiUcRrZagEM
 qfp0m6caP17klnbpR
X-Received: by 2002:a05:6a00:1825:b0:823:108c:5bae with SMTP id
 d2e1a72fcca58-8274d908242mr1403431b3a.8.1772161769882; 
 Thu, 26 Feb 2026 19:09:29 -0800 (PST)
X-Received: by 2002:a05:6a00:1825:b0:823:108c:5bae with SMTP id
 d2e1a72fcca58-8274d908242mr1403407b3a.8.1772161769524; 
 Thu, 26 Feb 2026 19:09:29 -0800 (PST)
Received: from redhat.com ([209.132.188.88]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8273a059e89sm3630384b3a.60.2026.02.26.19.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 19:09:28 -0800 (PST)
Date: Fri, 27 Feb 2026 11:09:26 +0800
To: Jinseok Kim <always.starving0@gmail.com>
Message-ID: <aaEK5hCnkPGedhQV@redhat.com>
References: <20260226155929.3500-1-always.starving0@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260226155929.3500-1-always.starving0@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: n5bj5yjAShOxfkiqy48pEsHGkBeGNkZh9cI2nU3OFmg_1772161770
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] open: clean up make check findings
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
From: Li Wang via ltp <ltp@lists.linux.it>
Reply-To: Li Wang <liwang@redhat.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns,lists.linux.it:dkim]
X-Rspamd-Queue-Id: 48EAF1B2305
X-Rspamd-Action: no action


Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
