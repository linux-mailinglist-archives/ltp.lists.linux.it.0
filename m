Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBo8BRX/cWmvZwAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 11:42:29 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF94656BA
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 11:42:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769078548; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=eq6KpYrcB1e1BJIEOTBKZjevK0SN5Cm5hrmBof4kF6E=;
 b=JBPFjLrDkZsBEjdkyiz7s6T91GOQzhAUCM5tirJDNeQR/XYJaHMfDAQc5QjsFNUi9ZQYo
 nliicoZUZn0mS98rfMEoxVU8wWSbeUwAxNNSbroOH3WR8xQkZZHDO1CtMtgCHPxlHrPKJoS
 0bGln4RNxGYmeh+pjDylLryKlOsfUL0=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7838F3CB33C
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 11:42:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 910833CB3FC
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 11:42:03 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9C1861A00A58
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 11:42:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769078520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JlY6uzF66JGRCDRSs6D/L1ARtf9Sa+wcLyEo1kIoGO4=;
 b=Yl4AOp+f8HpTThOk2B67ZT7EsjU9iBbRC8Ig9T78lns2NOZKqKJ8yx2IcXbESQHiJQE42Z
 zHgVEEKMEj0qT8K2YugFYMg2+Jb51K0N4ZAECjaQgZs8G8L1okLnnJPY2a1/n8YpsTyesE
 vlfbLSH1znBz3iR7e5+h7F2gmjCydUA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-AMpXzUTtPWq3b0th7Q1PSA-1; Thu, 22 Jan 2026 05:41:58 -0500
X-MC-Unique: AMpXzUTtPWq3b0th7Q1PSA-1
X-Mimecast-MFC-AGG-ID: AMpXzUTtPWq3b0th7Q1PSA_1769078518
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-435a0fb0c9cso798693f8f.0
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 02:41:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769078517; x=1769683317;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JlY6uzF66JGRCDRSs6D/L1ARtf9Sa+wcLyEo1kIoGO4=;
 b=qZ60tUcRuXNzWcA/RzcWgYwLsU3H84+PQKvqhImfNjvl6VycpRFOt5iXpF3yNgYeG2
 2/8VhxCZ0NdaUO6AQddXsJnbMc3aLncFQy5E5q3Bm/rry/tl/UvEikG4NSUoR9mGickh
 Od5Gnvi1wuKksbgtao5yoHHC9O9u3f661NdmUipCLGlpR193MgbnmchIAnma0b0Yo1Yp
 C8P5PgTyc7Z6tlmAdE7cmjDVmgpwTpDf7eWbljUBbbQZyq/QLjeqXoT/h7pLJMqpSPoB
 j5tKAoZ5US3hIXqwpG8z9a4cOuZuk4gmKZbYLhu2NSoilSAsUF6YZHJo0FXPDMvPVHeq
 0K6A==
X-Gm-Message-State: AOJu0YwfqKHeCOeVx1Bd5OrhG7uT1LCW0FGnsdNdk/KnNdk+633dg++N
 T9T8r8kuzpHlugMrwzZFOxjzfTbCuDiBIe59KjeVO5T2kaA6akq6zcG5EQjk7pVIuOQgdISOb83
 AFig4L8gpH+Vtkehrj5H7y6QH+y+39VINwpDGlH/lY5zE9Z2pJRy1auKKhy+uC2SFzejqIWPPqO
 lXloNivbJw6p/zKTi9KxPa16wGLXk=
X-Gm-Gg: AZuq6aIJI67XCRFldwrU027P4SJdmuZCD1Jj1vhihjtsTsNktcZzktUAJopK9lm/lkB
 kG9KwAw9VMBdqod6t89FtSKO941e8O0kTI85UFNCr+ZOnTjPEk7ateAzLVOm4NYxoGqBj3lTs5v
 hfVJp57c4BKBPUfdQsgIlp12GkWU8Zz2dhwqsOQg5OuyVd7SlxQkzVv8gCfBVU8sAX7Q==
X-Received: by 2002:adf:f851:0:b0:431:344:5a2d with SMTP id
 ffacd0b85a97d-4358ff56998mr11472050f8f.41.1769078517496; 
 Thu, 22 Jan 2026 02:41:57 -0800 (PST)
X-Received: by 2002:adf:f851:0:b0:431:344:5a2d with SMTP id
 ffacd0b85a97d-4358ff56998mr11472022f8f.41.1769078517086; Thu, 22 Jan 2026
 02:41:57 -0800 (PST)
MIME-Version: 1.0
References: <20260122102606.87754-1-liwang@redhat.com>
In-Reply-To: <20260122102606.87754-1-liwang@redhat.com>
Date: Thu, 22 Jan 2026 11:41:40 +0100
X-Gm-Features: AZwV_QgyE1Y2aybZtLOhhf7dEro5UBSjF8XsN2GclA5Av1zFvpPfqkfGB5qmbHQ
Message-ID: <CAASaF6w3S2STiyS9LvOsK_uVEvRoO6uq=XNMG-cMNheC0k1RHg@mail.gmail.com>
To: Li Wang <liwang@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qbnOfLT57jPvR9IsTnCe67gvGLHBD4lQcveLrySdUMI_1769078518
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] clone10: add support archs
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.11 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[jstancek@redhat.com];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.it:dkim,linux.it:url,linux.it:email,picard.linux.it:helo,picard.linux.it:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: CBF94656BA
X-Rspamd-Action: no action

T24gVGh1LCBKYW4gMjIsIDIwMjYgYXQgMTE6MjbigK9BTSBMaSBXYW5nIHZpYSBsdHAgPGx0cEBs
aXN0cy5saW51eC5pdD4gd3JvdGU6Cj4KPiBTaWduZWQtb2ZmLWJ5OiBMaSBXYW5nIDxsaXdhbmdA
cmVkaGF0LmNvbT4KPiAtLS0KPiAgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9jbG9uZS9jbG9u
ZTEwLmMgfCA2ICsrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4KPiBk
aWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9jbG9uZS9jbG9uZTEwLmMgYi90
ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Nsb25lL2Nsb25lMTAuYwo+IGluZGV4IGE1MmFjMzU2
OC4uOWZmYjQ5YzM3IDEwMDY0NAo+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvY2xv
bmUvY2xvbmUxMC5jCj4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9jbG9uZS9jbG9u
ZTEwLmMKPiBAQCAtOTEsNCArOTEsMTAgQEAgc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0ID0g
ewo+ICAgICAgICAgLmNsZWFudXAgPSBjbGVhbnVwLAo+ICAgICAgICAgLm5lZWRzX2NoZWNrcG9p
bnRzID0gMSwKPiAgICAgICAgIC50ZXN0X2FsbCA9IHZlcmlmeV90bHMsCj4gKyAgICAgICAuc3Vw
cG9ydGVkX2FyY2hzID0gKGNvbnN0IGNoYXIgKmNvbnN0IFtdKSB7Cj4gKyAgICAgICAgICAgICAg
ICJ4ODZfNjQiLAo+ICsgICAgICAgICAgICAgICAiYWFyY2g2NCIsCj4gKyAgICAgICAgICAgICAg
ICJzMzkweCIsCj4gKyAgICAgICAgICAgICAgIE5VTEwKPiArICAgICAgIH0KPiAgfTsKCkFja2Vk
LWJ5OiBKYW4gU3RhbmNlayA8anN0YW5jZWtAcmVkaGF0LmNvbT4KCgotLSAKTWFpbGluZyBsaXN0
IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
