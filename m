Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AzWJeH8n2n3fAQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 08:57:21 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 305831A2242
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 08:57:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772092640; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=by2h2B4qdHqZB5D7L2pDdK9XeN9X/QNvZo4egtLRvTY=;
 b=lZHnNoJQ7DnHnQ8Ro05oZS53AVLaKCfwtVy36m4lmwqWFOoK6iIuGZZvWImagdZ4gPbx7
 6oRsKDCpqAfLhZRUyQEUv6UMqMV0qqKax+1ZJ1Bn/5NtNArB57dy113ut/QoLbthNN+VhN6
 FDtsnrByHbsADE1s9WKVIOrbBhlPGok=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 067CA3CB44A
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 08:57:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 774853C7721
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 08:57:07 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B1FE0600726
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 08:57:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772092625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QTAxrQv35vevp0I2Vt3U00NP0JdTDS2VSpuXwribL+k=;
 b=U+aUXny3ANyJXeNDRiWm+8LMILQWIodT9fLQfGRG8MtPSvvQNstIdv8d60IwnAuBptLo/r
 66sUbizQzEWhuGKoNIl43aoyrXtqXXtkY8tzfm6f+fKOC4HySa1Gw8y+G1if70Ph4nA45F
 qkCYnsR6RwFSKjz6oz/Hl+kEhnll1ls=
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-lXSOt7usOQm0S42v2xR-TQ-1; Thu, 26 Feb 2026 02:57:03 -0500
X-MC-Unique: lXSOt7usOQm0S42v2xR-TQ-1
X-Mimecast-MFC-AGG-ID: lXSOt7usOQm0S42v2xR-TQ_1772092622
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-2bdc1b30ac8so9724353eec.1
 for <ltp@lists.linux.it>; Wed, 25 Feb 2026 23:57:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772092621; x=1772697421;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QTAxrQv35vevp0I2Vt3U00NP0JdTDS2VSpuXwribL+k=;
 b=jSG4OMPkkfKCX3nezV3V7NnssJymEENAvrW2fhBOkVTxXzW69cdHOoxnVjM6AiTmu1
 Rf2Dc1OxdmxVX/GrwKqaJ9y6nGDeMxnBb7ro6hSHuqgqFgjegrkTlMMPj4/vHP1WuekX
 BqxHuRTC0odLVVtOY9HZYT/GR5LFTUsbcqk9idUa60Mbvl2sIrnLvcMo/vUEKy4EErYJ
 cGZR7f16EQ/SoVccRxkHiynMq4vRUAqvuYuO5VybrZV0PecbEgX3y7b7P4N8KObPGRBA
 /AbfyDAdpraMIK0IVFiijrTz5jJwdKsa7666ZEI7qmS0IpJgpG7dB9szHk9mL+oANs+R
 +LrA==
X-Gm-Message-State: AOJu0YymZ+nYlHPAbl59DOs7AsIN4QzbCO8GQrTvKjNIdTBy7abBezp9
 EmJO5K3StNDB+uESDbN9UHClXb/yxul+Ed5NyIB8MlvCS1+sEaMqvCTjfSMiymAd+BjPOtAp5nf
 gc5CGx4uLVwublertlFyUyGT/p5tl1qMX3tmDaUn4Cve/3hHqBkOw8apGs1DYp9qlxlh/URSOkN
 o9/jERm1s/NoW8NUp4RWCUUUG3VO1dtgaib7U=
X-Gm-Gg: ATEYQzw69yGQcmKWV/Ioon5a8mYGY0Clja2tQwmzAveXgGBEfqzV347jJdSSKBQD3S3
 tD4rwDx4OufKD+zY/LgQJ8vZKknLKJptCHdYs2fWzMVACQRVlAG93OQ0ISt1q5B73VgBD4+0OQY
 jUAm1wHV8bTMKHyBAERXNh3jrWgz1E2kRgF2kL5ZvpXYny8HPeC2KVz4g21hzZLXScZp+bK5Fwa
 3XevCQ=
X-Received: by 2002:a05:7300:148d:b0:2b8:66f3:2522 with SMTP id
 5a478bee46e88-2bd7b9f2a5dmr8458054eec.3.1772092621124; 
 Wed, 25 Feb 2026 23:57:01 -0800 (PST)
X-Received: by 2002:a05:7300:148d:b0:2b8:66f3:2522 with SMTP id
 5a478bee46e88-2bd7b9f2a5dmr8458044eec.3.1772092620703; Wed, 25 Feb 2026
 23:57:00 -0800 (PST)
MIME-Version: 1.0
References: <20260207145942.299366-1-changwei.zou@canonical.com>
In-Reply-To: <20260207145942.299366-1-changwei.zou@canonical.com>
Date: Thu, 26 Feb 2026 15:56:48 +0800
X-Gm-Features: AaiRm51CJNhBuQFDeU3t29vLx9rhHrE2XPgTfM7U5XchCVVM6_r5Hr6iDPGWYfQ
Message-ID: <CAEemH2cRzDnxDio4gW-5h8i3Tvd3=sSvq7yYqZa4SU_zbctTqA@mail.gmail.com>
To: Changwei Zou <changwei.zou@canonical.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zDZF0otJvVn29V13rNy4B83W2zZh5B7o2AxrbfgTdGw_1772092622
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH] lapi/tls: reserve pre-TCB space to avoid
 undefined behavior in clone10.c
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
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux.it:url,lists.linux.it:dkim]
X-Rspamd-Queue-Id: 305831A2242
X-Rspamd-Action: no action

This patch merged, thanks!

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
