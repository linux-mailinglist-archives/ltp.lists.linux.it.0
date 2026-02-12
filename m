Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCTVFWeLjWnq3wAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Feb 2026 09:12:23 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E908312B22E
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Feb 2026 09:12:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1770883942; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=SHik/XjOYdC569JhKRkukm4u8lTROh02vsOw42HuThg=;
 b=Y/UnwhxMdSJe3+bWWV2bB1oAxBeT3XL1CDdi5RwTYei5tR4ZRySwOi87VLB0OfQBfWWjn
 wT1JMpTZunDH1vqi6OImP7hv4W1VIGiEHP4KReG1z50I3ZNWK6oUwTgQ9L6veqKtKa8T7Vn
 DUX5/7HiR9eJ2MsvhQAQ0gM9u6BGdyg=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A0D303CF135
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Feb 2026 09:12:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C4B7A3CC23E
 for <ltp@lists.linux.it>; Thu, 12 Feb 2026 09:12:18 +0100 (CET)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id F073F600684
 for <ltp@lists.linux.it>; Thu, 12 Feb 2026 09:12:16 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b8f96f6956aso38133366b.3
 for <ltp@lists.linux.it>; Thu, 12 Feb 2026 00:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770883936; x=1771488736; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CpJ3GLgb1ycVA0R1rczUu2mVS8ePVQdQlerO4MHR2M0=;
 b=XgKsZ8OFV/lPg4vWTfIISrM2Khyi7uQe5x0RYKhRr9S0aL61w8Rdvzku+sqwPIqqNf
 wp6XRxO7J89sTSSHqZHijalgqch3ViLnJomHo6aaArcsKyzzrDobBJq4XwchGOzfryk3
 jUNRWeQ/S1/+C3voqFC9QBXoo0cpq5EiPY28qSPti+ytc9AvNRAjtoP7T3vZClgKJBpm
 58dQOm+zwCIzRJwuKAiAD+O6FaNXlexdpQGnx2aIWxNhKoInQkVHQr7KAMKd/DZbzd1T
 6Rgmysk1jlMJhfV0BoCbFzrWn3/0LXgPezM8l4zhK0lg8E2agCcg1M9CnndczX1bUNf/
 yfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770883936; x=1771488736;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CpJ3GLgb1ycVA0R1rczUu2mVS8ePVQdQlerO4MHR2M0=;
 b=JSNMDX7a9hthiLuq2q544U+vjGZf9gMaWa78ubVBGD7ikLR3i2riZ/KmjMlgEWkAeV
 LqNpRA+DTwOU2hFs/0rfpDupphEJ80o0WzPE3+pMRLmTAUasPuWWrSt6h+dJ3PlZF0M9
 NxRV2MzkaUSFjf3ykdnWIxfuswwXoDyd0ZR8uzwfcLk0GCAOoLKpzMCzWtVe+xJVTrzt
 DVloIXt4IbnW2y2jIPhj2t3gxNEDosiBGKWEHlgIvTAHL4YNdraDmKEnxfAtBI2xxT8s
 oYE+ZokaxxX/MCrTkb/hI2tHF8Zn2NQw/uosAqk1FxHS6wOxgawz7y5U0aEpzWXJI5N4
 fBsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlT8UmhE0Fk8Ngy2mjtdaAVWLIyu9xJ4u0q6yb53tNsR6bGlGGEele5LzGkVmxSGAaPEo=@lists.linux.it
X-Gm-Message-State: AOJu0Yz70YrEkxTV3zf6zt1R5V20DOriv1rFrL8Z2185w7o3w5Mgi9i+
 k6mF1fjgZC+zJyj8A8RNNRG+I0VdQAMkixbDFB8jbc9sGtlmD7fJZ7CxCXX4VREEqL0=
X-Gm-Gg: AZuq6aKceRWMc8vlLjkdeKFvVmbbcYrdrx/48ot5f6BBAKMavLwqH+RIOLvWeQmjHCB
 ktfa5f4qLz6ZGLG/L18CsiFzfXhHC6mvGJmxS5Hj38ftCMRL4VJwMCG/U652WIyZphbTC0epgf5
 +S7CN3IQ4DcE7GKO4Z8YUf3T7MTh4siey6vzh4lnRO5SMMbk6faNMNXWETzCRIE4y3CBL7ZuyXT
 bjo9HaJBoTqNwqX647WEdyZPADLo9gDBXFFP9WRjht2NEFa55sYau6rOfTfVugyBC/7dmFCeDX6
 Dq0TpD7fceQnJPu+tDcNjgaZnh5oh9JVcfoYkYG6RdO2m1ZagHTKO6FhdZJbbajSIojc4Qi16ae
 5rViGv7+nZs8NUAz9EMj1b2Ax++58tnb4fiayQGs0P+SIo2ZthJ8I0oPiQqSwnjjzWco+Wi5ldX
 A4TxeUOSR2fc7vgJv4vsfdLhfwSgLoRC0=
X-Received: by 2002:a17:907:3e14:b0:b87:685a:31f3 with SMTP id
 a640c23a62f3a-b8f92c660femr72385366b.52.1770883936167; 
 Thu, 12 Feb 2026 00:12:16 -0800 (PST)
Received: from localhost ([2a02:a31b:84a1:b780:6f4e:21d6:82d2:5333])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8f6ecadb32sm138161666b.64.2026.02.12.00.12.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 00:12:15 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 12 Feb 2026 09:12:15 +0100
Message-Id: <DGCTYOV3F3RT.1KY4KO5LAC8O5@suse.com>
To: "Petr Vorel" <pvorel@suse.cz>, <ltp@lists.linux.it>
X-Mailer: aerc 0.18.2
References: <20260212080323.137459-1-pvorel@suse.cz>
In-Reply-To: <20260212080323.137459-1-pvorel@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/1] doc/requirements.txt: Add setuptools
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns,linux.it:url,ozlabs.org:url]
X-Rspamd-Queue-Id: E908312B22E
X-Rspamd-Action: no action

Hi,

I already sent a patch yesterday afternoon and Cyril acked it. I was
waiting to see the CI today morning for merging.

https://patchwork.ozlabs.org/project/ltp/patch/20260211-fix_doc_build-v1-1-42897785e0c7@suse.com/

-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
