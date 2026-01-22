Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGrvNmEJcmmOagAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 12:26:25 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A88E65F80
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 12:26:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769081185; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=bREHy72F2u7yJcTDa/wkUqrpermibqIZBuRoflTU6BY=;
 b=RRzIbZCp6le5X4DA4MT4f4yyEwrq1X4uykCvCADZZluMWU6L6QdI5tRv/s/5LszdTsrZL
 jGEcgUn2QjNJsLXNow/X3sSqq21HkIGvQ867eK2j7jKqKbEDn6paoamEcM8uB/4415erfQg
 jf5RUkR/etpZjZ4ajGR9rLTYBw3iXO8=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 26FB33CB3F8
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 12:26:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BEBDC3C1B59
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 12:26:22 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 26134600A5F
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 12:26:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769081180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eV3NG5qflPd6t3N0Hm1RnirkqKHXr0TvtWFDO9l9vSo=;
 b=KldNBV7UfHXfzvfov2YDEhcZSAykyBJgCJe5Hi8nEDX9bZ+sNxIqNB25Ya2wtwNo5CIW40
 ZZ44UDL5HuMFfvpjXZErhfm9yqv9OLvgjWNYI9Mm7gJea34Q2d4Mud9HOrf9IkZ7zcjHEu
 XMirEpx9OmMiy2jtk3doQDQlbZYsg7M=
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-Gq4CIJUZOgifqY1diXv-QQ-1; Thu, 22 Jan 2026 06:26:18 -0500
X-MC-Unique: Gq4CIJUZOgifqY1diXv-QQ-1
X-Mimecast-MFC-AGG-ID: Gq4CIJUZOgifqY1diXv-QQ_1769081178
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-2b708fa4093so1841416eec.0
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 03:26:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769081176; x=1769685976;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eV3NG5qflPd6t3N0Hm1RnirkqKHXr0TvtWFDO9l9vSo=;
 b=wy3Kl5rBF4R0OY7V314CoisfEZMPqbyMBs1hgjpJ1d6UW5EkbuUwDP9yvh09CNGM1F
 1w/XKk7zZnHtGy4FmwU8Jk1+TfAyAh3+IBxT/tqEUaHZa+v99uXFDEZj5EhYVyYVm5aP
 Lcb/zpqGZVjg4SE6gE+TYcqxh3tc1GbD3rUaNpkm2BfPdyVZKzTWHWVokTlY772khHRd
 yAfOhlhwZI1rI1jqcpbsJZSvABUmUs6ewxRrL5dTLL1DaXf+o3+gbCkBgV5GYaaugNWI
 UdH6MaRiL8qXMs/2itH7Ixys0RSTq/Axmvye/47AxflThS6xNxgRhC0iVMT1bn8fDg1d
 Xkmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjqUF9zaiMxy2PRHtN7dSYCX4l+6gSohKTMKdHx4fz67jnrvFqzEzphpdL3RoLZ7Uihls=@lists.linux.it
X-Gm-Message-State: AOJu0YzHzbCVLwWXSH1QLAWNFLmvDNQwXgBOQQyumOuRg6+kVSL7xhh8
 VKVvBeSqTnHzh78/mSz4kISrVRp9DIXatQ6rR85kZD6IZYpzbjNdBvL1hfpLyopCYC/qiiKHgbt
 Z64ESJ+62iYu1oBKTNkSYGUmm6k6qYf2MTcxdpflq/ZSm6fCSkvKkdVaDfTgDi7BsmhFK7pqv/O
 EJje6P+wAdAn5bodhnypY6g/d9oDVFcjrmGM9M1A==
X-Gm-Gg: AZuq6aLf3q3goVa7LWpb+QveDbIJdEmSK5FWlGuTcbej5e04EBC+W91NjkVExjfN52V
 j0fceOn+5n5dP9aeyiQSa1TPd3wTT8L8pfUS5jfD3wkNtNEkcWJ/uxjdYPJWVFEid9yBWMsdkse
 rJGunn8P+YDfh3CuP7aV+RbFiqggZnsvqkRQmN2LVcvayBHWarsHssJr3WVOwqirswLXk=
X-Received: by 2002:a05:7300:5391:b0:2b7:1abc:a6d2 with SMTP id
 5a478bee46e88-2b71abca948mr2695278eec.20.1769081176116; 
 Thu, 22 Jan 2026 03:26:16 -0800 (PST)
X-Received: by 2002:a05:7300:5391:b0:2b7:1abc:a6d2 with SMTP id
 5a478bee46e88-2b71abca948mr2695267eec.20.1769081175750; Thu, 22 Jan 2026
 03:26:15 -0800 (PST)
MIME-Version: 1.0
References: <aWjZX0fsrTJMqq49@yuki.lan> <20260116072020.GB556902@pevik>
 <CAASaF6xyVVTFtLHcyicMZsmiBhiq5f16d-nhHTfLw3Nis_TKPg@mail.gmail.com>
In-Reply-To: <CAASaF6xyVVTFtLHcyicMZsmiBhiq5f16d-nhHTfLw3Nis_TKPg@mail.gmail.com>
Date: Thu, 22 Jan 2026 19:26:04 +0800
X-Gm-Features: AZwV_QhFeclS8dgzgyqEwB9FanFL1DqXZLrc1smlpFoxUOrtWQEUX4AKm5K2B_s
Message-ID: <CAEemH2cVjrLmAQRJOf9gAC5epUkbtviR72zKK+PdyCTPQ+93Qg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DbQnppK4ceQwfXKelU3EP5xxFp_qmUHSTlPHOaAmCvg_1769081178
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] LTP release preprations
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
Cc: ltp@lists.linux.it, Martin Doucha <martin.doucha@suse.com>,
 Liu Jian <liujian56@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7A88E65F80
X-Rspamd-Action: no action

Hi All,

These two issues were discovered during pre-release testing
and should be resolved:

https://lists.linux.it/pipermail/ltp/2026-January/046231.html
https://lists.linux.it/pipermail/ltp/2026-January/046238.html

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
