Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDPdEP/JlmkDngIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 09:29:51 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DECF215D118
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 09:29:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771489790; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=87ibVTZcOCwecfblaMrbcBTK0LfPDLX+uFJ7byF+MJ4=;
 b=VHwWGAzpCtgqKv/c2RchpBHbl5EH2BgU9lXly1/D9gwXhv6x2d5lEJU2DUZxgub5M5snw
 TG0bkS8vqDnTCP/GsyhFwyfpFghpY/Il1XPm/kgiz+8LH/9/HIHkPvxlR0qWMscUKsEbU/t
 2H3CpKAzeaJL3L+cDl7hrqB6/AjY/Fo=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B2493D0677
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 09:29:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7F28A3D0652
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 09:29:48 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id AEB3B60071D
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 09:29:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771489786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=coThZ9qichmBaHEmXn9eRsD5NEbLI/oeorNzZELX1EI=;
 b=Ln9iRwVn/7JiWummnKtpOJvhjOsdr9YunEbx+IVNw61+KIakEUsjR7noHpfuwGCE02gCYy
 bEY+Cgv9A3HWqNUkFazam7hZ3iZ9FxiiaI4d7wil7AuDpJVTayx2xoM69uB/X6IqL9otgg
 K+Ulj0Gp1ewqiuKa3g4t+yL6TkldMHE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-8ILNkkCrNzCaIfcCDpE9Vw-1; Thu, 19 Feb 2026 03:29:44 -0500
X-MC-Unique: 8ILNkkCrNzCaIfcCDpE9Vw-1
X-Mimecast-MFC-AGG-ID: 8ILNkkCrNzCaIfcCDpE9Vw_1771489783
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-435af2d3144so429435f8f.3
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 00:29:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771489783; x=1772094583;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=coThZ9qichmBaHEmXn9eRsD5NEbLI/oeorNzZELX1EI=;
 b=hvSWZT/uQbRhzHpHhgpekiIhpUzoppTKnEYLoGPbF4vMzue3IzKJHQJrx8zmFwwvGE
 OILdzZxHKfD6xFjmeApSTddA8eRvIzJhSje6eh1q6a+ENbY8zAxsV+VG6CQPM01u29LK
 7gySZgM/KMiynmcVSrRNUBRLgwIJIs34mhQP2mhdcFkvgOIj3Uo1lz7BFWgLYAUUq2KL
 pJjuyAGkIn16HqVtcCzA+s2Wzqq3ECyQaVx1QSsQsyumiSUOhzasRNuvNYc0v2eALq+F
 /D/BxB99HFjmQrZNKr3Al/lZo4RXxNrjiVjhhSOFc9jWamDapjCx81ZNY2PoiEsSIt9H
 fs+g==
X-Gm-Message-State: AOJu0YwRVfsyz8vErdwEoOFsw7R1db18/hB1mbU0ooZHjpZYAna+gQ7j
 XH+psQnlfUuTYabTXuBpNiU4iZL+XKTwzgzmJG4WnbcfKAFYfEdhLB3s5cQkyqZPq/063dP/BYE
 ZKbtGXRZg2avKtqcz4L3DkC1U5WtIrL0rf9NiJnOC8TZ91/fSqnpNyUirzEnA31kAAEawZ3l8Ey
 CXCG7MhGHDeQ23ZY2n5VcttXIOm6k=
X-Gm-Gg: AZuq6aKQ1VNVb3S4ytgX8T027R+d6C0MojjyyP4mpAkzrgma8koWtnIMAqhBNx9XjEX
 JrZZxUB9sbvPrjn6GhJOVJ2CFlSbatHdQSOMMrWBeUMPDpSY/bnTXsmYsKu0LgfDRJALHRtZ5u7
 f6goyARjdIqLwLsMwljIgRw2oGlKJX3TZFsZK/7gOZsAlK96xoywxIiPdWG5b6zL0onaAo+cpGr
 4LHVg==
X-Received: by 2002:a05:6000:2689:b0:436:23a2:5e32 with SMTP id
 ffacd0b85a97d-4379dba719emr30460623f8f.48.1771489782871; 
 Thu, 19 Feb 2026 00:29:42 -0800 (PST)
X-Received: by 2002:a05:6000:2689:b0:436:23a2:5e32 with SMTP id
 ffacd0b85a97d-4379dba719emr30460585f8f.48.1771489782384; Thu, 19 Feb 2026
 00:29:42 -0800 (PST)
MIME-Version: 1.0
References: <20260205121540.329921-1-pvorel@suse.cz>
 <20260205121540.329921-4-pvorel@suse.cz>
In-Reply-To: <20260205121540.329921-4-pvorel@suse.cz>
Date: Thu, 19 Feb 2026 09:29:25 +0100
X-Gm-Features: AaiRm51BfJxWP_kfDgvFzuN0LJcLKre1eu7BFDvnakSoGrw9eAcvArC0oWJRcdA
Message-ID: <CAASaF6z0voTASQHdaDnHUHBGvY95Ftpzy5Q4OkQjVh7Y7uZ6Tw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Me0FWUoCGuwNYqagu3tSjozHxUkZnLuxw15xlXDeCHw_1771489783
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 3/6] runltp: Remove
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
From: Jan Stancek via ltp <ltp@lists.linux.it>
Reply-To: Jan Stancek <jstancek@redhat.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>,
 Tim Bird <Tim.Bird@sony.com>, Julien Olivain <ju.o@free.fr>,
 ltp@lists.linux.it, automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.11 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,virtuozzo.com,sony.com,free.fr,lists.linux.it,lists.yoctoproject.org];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[jstancek@redhat.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,linux.it:url,picard.linux.it:helo,picard.linux.it:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: DECF215D118
X-Rspamd-Action: no action

T24gVGh1LCBGZWIgNSwgMjAyNiBhdCAxOjE24oCvUE0gUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2Uu
Y3o+IHdyb3RlOgo+Cj4gcnVubHRwIHdhcyByZXBsYWNlZCB3aXRoIGtpcmsuCj4gaHR0cHM6Ly9n
aXRodWIuY29tL2xpbnV4LXRlc3QtcHJvamVjdC9raXJrCj4KPiBSZXBsYWNlIGl0IHdpdGggc2lt
cGxlIHNjcmlwdCBqdXN0IHBvc3RpbmcgaW5mbyBhYm91dCBraXJrIGFuZCBleGl0IDEKPiAoZmFp
bCkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5jej4KCkFja2Vk
LWJ5OiBKYW4gU3RhbmNlayA8anN0YW5jZWtAcmVkaGF0LmNvbT4KCgotLSAKTWFpbGluZyBsaXN0
IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
