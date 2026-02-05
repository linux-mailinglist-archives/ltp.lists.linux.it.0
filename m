Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WESFARiThGk43gMAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 05 Feb 2026 13:54:48 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 875EFF2DA0
	for <lists+linux-ltp@lfdr.de>; Thu, 05 Feb 2026 13:54:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1770296086; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=IyhEf9+MdynShkoHXJBBfApnbKwZDmJ5qIHQVdhwX+4=;
 b=R1gYjItjiDbiWbrvPB5MsycaYGh9EAn5oPN29tZNID0+xa3oFhPTdbZ7FmY/NQAoehWqL
 V9ooUB9xojUWENdO96Ifeb1shaOxeOLXgc5MVlPZveuv1VjcCb6T+P+mgY7BwgP0BKCuhNu
 WewgvJs8qF8sk7YgbU6kbJPgnvwJuFU=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5907D3CE2D9
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Feb 2026 13:54:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3D3203CAA65
 for <ltp@lists.linux.it>; Thu,  5 Feb 2026 13:54:34 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9782320016D
 for <ltp@lists.linux.it>; Thu,  5 Feb 2026 13:54:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770296072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mYEBxujDknH+G3XBFNxwehVnHk+U/DQCBkMs9a+Ysd8=;
 b=g9qF0RcNv/0yh5xnXEzPJs/RH4d1kSpt96X45wEv5RgK8AWFW1vcgY1iHEosJ8REjjgoVb
 XsscDSnRC/Z/t7IAjgTmbyDxAnWpRCCbnWHsQPYrTINc60CTJLq3yoa9eSS8bi9PAbE/WT
 0butYBa2lIjciBKciUAVwMR2fa1IFDI=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-ErhhSDO_Nd6BOk1vX2ecYQ-1; Thu, 05 Feb 2026 07:54:30 -0500
X-MC-Unique: ErhhSDO_Nd6BOk1vX2ecYQ-1
X-Mimecast-MFC-AGG-ID: ErhhSDO_Nd6BOk1vX2ecYQ_1770296070
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2a76f2d7744so10159695ad.3
 for <ltp@lists.linux.it>; Thu, 05 Feb 2026 04:54:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770296069; x=1770900869;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mYEBxujDknH+G3XBFNxwehVnHk+U/DQCBkMs9a+Ysd8=;
 b=nY1V6RwEXT6pHWEI6nqQeZNQ8NGSCoVmtLvp5TbHHTKxxaEkd3GBy7+7DV2yP/lto1
 Uxh3IHWlTqUk40seAqhWCDrUTSQDVpFwHGY+MNpVV45+Y4Px1JZWvyveKo5tT72tpRRY
 hiInzEYBoEqKjAqD6nVmtQHG9LXr0mC0GHwSk48X7xPxV/FvyCsfUYBctcWFRG5q8Lrn
 TpeySwDu48WNkC5Gmi+7Sg950Po9kPjY01kE55mWX1lCDYipuSitzGc0ud2uOvgGlnux
 G2+gZDEgXCDNi+RTFmI9/n3Yfab+xoh1MRmYJ8LbjFwijFNh5rrCC0i0FOUpv4B0XL4o
 WgnA==
X-Gm-Message-State: AOJu0YzSDktafCaJh/1+kFclCKzrkKWi3/LgWe3+MakZZ8ermRbufF/Y
 1JYafIVwHSH4B+AxifDFBJgXtJG9UNBsJWbRvTEZLwtl5ia8ApmCKOPODUsvUBdR8pBVWC1caoB
 2cnGArgATIEwz8os4fNBUiM9a/pfqMuz+DRlRgquqjkA50XNIoUXldy//oetc
X-Gm-Gg: AZuq6aKi6hgcwkWA9AYWDTw1qemHoWm9cIsdWlYIiU6Ji2RYqwlUBCEXlTW3g0kq4mL
 mzseEM+LfhOAb+oVQFnj23s4vaTGWM6wxV5KzHoGMwInQ44rOfmo+oR9sPYPGP+vJ7NxX4o7iZS
 H8sC9YY1oCVtgHyaFpsOKWvpYJhz3oIYOamJo+AK0Vp/YkDIKVfaoxMx7CDhzDFJBA2vBKLsXse
 hlsguukzzaQ1dTKHJkUOPbhA6VNGfqV9j87hRFk9aQ9pb/WqJqnYtYh90Hds6RoO3bTyqDvBW+I
 7Y84hD6i3mu/e0y5MZeuu9Pn2WlX6gwkqW6ET6eXHRhv8KYU72o3OVm9//+2aQrd5vAw6Y9mnU4
 zQk0n
X-Received: by 2002:a17:903:4b0d:b0:2a0:bb05:df55 with SMTP id
 d9443c01a7336-2a933e47f64mr63614095ad.21.1770296069014; 
 Thu, 05 Feb 2026 04:54:29 -0800 (PST)
X-Received: by 2002:a17:903:4b0d:b0:2a0:bb05:df55 with SMTP id
 d9443c01a7336-2a933e47f64mr63613935ad.21.1770296068653; 
 Thu, 05 Feb 2026 04:54:28 -0800 (PST)
Received: from redhat.com ([209.132.188.88]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a9338908casm69366695ad.31.2026.02.05.04.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 04:54:28 -0800 (PST)
Date: Thu, 5 Feb 2026 20:54:26 +0800
To: Jinseok Kim <always.starving0@gmail.com>
Message-ID: <aYSTAheeRvguJfqY@redhat.com>
References: <20260205122753.3163-1-always.starving0@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260205122753.3163-1-always.starving0@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yVT08A_oLfkDBOScS8l9Ii9w9N88mWvnCIu97eYE-KY_1770296070
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] inotify: fix typo in write() error message (1 ->
 BUF_SIZE)
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
	R_SPF_ALLOW(-0.20)[+a:c];
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
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.it:dkim]
X-Rspamd-Queue-Id: 875EFF2DA0
X-Rspamd-Action: no action

Patch merged, thanks!

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
