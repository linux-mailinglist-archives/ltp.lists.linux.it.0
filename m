Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIkfDzJfeWkXwwEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jan 2026 01:58:26 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4BF9BCCA
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jan 2026 01:58:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769561905; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=fT+KkjzCHJQlWM/8bdF4f1iXuo0mNa14vwUP5ULDV/Y=;
 b=E1msXex1ov2VVKtM04n2V6of2aDk548c7ViOuT2Js2rDumA00uc4CYN4Ya+D3jfqxCmna
 C3Y/dkpL8kUlgzEtdYRcYum57z0OI2w9qNfKjWHVPsYP/A7ijK7f8y+o5aZ9irHuI2irspU
 RiblBXl0L9IPw02iZPReA9BWkO+AqXA=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 42C0C3CA066
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jan 2026 01:58:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0107F3C4F49
 for <ltp@lists.linux.it>; Wed, 28 Jan 2026 01:58:11 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 93DE82005E7
 for <ltp@lists.linux.it>; Wed, 28 Jan 2026 01:58:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769561889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d+gCxwHRIguH/R5JjpZu2LtKGfyOAhQfkN3jJb6/Qmk=;
 b=IeIZAo7c+E5ss5JqHIiT1oZP7TIjTdp6jmh9qI3wl4FsJgUxhTt37QRSiFOF/+ScRAnWNE
 9B9bhZjnfMQMmSgCldu7wCC3DSGuhYb1Qs3zkIH60iTIuEcCy6gOfogtrzhh2HXEXPyZkp
 DREgCjfK6rLQAe4j/ybOx0KVY5sHO4M=
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com
 [74.125.82.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-9L4UjCwSM4aiBvdvXfGFvQ-1; Tue, 27 Jan 2026 19:58:07 -0500
X-MC-Unique: 9L4UjCwSM4aiBvdvXfGFvQ-1
X-Mimecast-MFC-AGG-ID: 9L4UjCwSM4aiBvdvXfGFvQ_1769561886
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-1247bb4db53so8369285c88.1
 for <ltp@lists.linux.it>; Tue, 27 Jan 2026 16:58:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769561886; x=1770166686;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d+gCxwHRIguH/R5JjpZu2LtKGfyOAhQfkN3jJb6/Qmk=;
 b=R0RwbYwgrxyvnGgQpVPXh6JurXw2tjN8KqwHBlAxerjxakospA6r9CYJp1BSLVtbql
 JXCwZOdJbxHoPiRNLmnVILZzSe1emxWhdooavO9T7NS8qZBiwzdITC9YoF8dVpzzmXsN
 m1Wrzt+IMkI8SbNw1M37eEcYlVhT682ElDJpqmksms4ohQzb5oCB1XWXZaE3hchLUFXM
 IXQ4DgDupO6qm5gyYOntBCvvMrswoFdly6O5QK8M0oXUmG7qhyUUb8eGnIO9jqxjpCD7
 Na19NFdm1Z22+fhfA72wk7n8RuGjMA56veI1Gka8fuyLCoCFNOaqM5GFqPyEolXdNbCr
 XRLA==
X-Gm-Message-State: AOJu0YwRIuYFG1f12jEuJuuJ1tPdrrH7210qkaAX3ngaa1auK1zZPqWE
 YVZHANhTNVX9Jyy2pI9h+AUb6Z2Gc63TAuDZqfkUjWLosjc3386SL5pXNkanxxTMnq448DFrSJT
 oQZWYbo1Yjp+XuUbnWEY6s1rk8Z0FvvGxNnHyrakABXMlVNambFEQ2HCeYT/Qa7KweghD75yEhP
 fkxX1wnfB83tsv0b6UNtrFOBW4juds0AAFmRg=
X-Gm-Gg: AZuq6aI/QABxMT8ZBpJQt9G1DWkWl1ydbVDfywS5r9VDB+tM6iCvP3TQs2lItJ8hkk2
 hwpJAM+5WkEd+sY2xwKZzMKyR9/yIJl4QK00VqrwvBeWNMrIwXAzlr8O85Je9/WUwRarrNjv5Qt
 YDjC9zR4xZFBXykm+S1j0RUTlU7vJKbfTgAHobjVUIizIYzG8WEIncrqht26ukK8wLFz0=
X-Received: by 2002:a05:7022:786:b0:11b:b622:cad9 with SMTP id
 a92af1059eb24-124a00aaeaemr2575160c88.21.1769561885650; 
 Tue, 27 Jan 2026 16:58:05 -0800 (PST)
X-Received: by 2002:a05:7022:786:b0:11b:b622:cad9 with SMTP id
 a92af1059eb24-124a00aaeaemr2575143c88.21.1769561885190; Tue, 27 Jan 2026
 16:58:05 -0800 (PST)
MIME-Version: 1.0
References: <aWjZX0fsrTJMqq49@yuki.lan> <aXi4P0YdKx5rFZ8C@yuki.lan>
In-Reply-To: <aXi4P0YdKx5rFZ8C@yuki.lan>
Date: Wed, 28 Jan 2026 08:57:53 +0800
X-Gm-Features: AZwV_QhIXa_YmWfTrh650U75q26f_R2BJPlinA5hNof2cb8T1ic5F8qIsxogQtQ
Message-ID: <CAEemH2eUY9Mi5K4awa4+sxQKCr9NkgH_SJSsM6mZZQza3bZbGA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zVlTdG2X2LgMiWQkEXqlyQeZNP_ux3TJtQzLKhGVNrI_1769561886
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	TAGGED_RCPT(0.00)[linux-ltp];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.it:dkim,picard.linux.it:helo,picard.linux.it:rdns,suse.cz:email,linux.it:url]
X-Rspamd-Queue-Id: AF4BF9BCCA
X-Rspamd-Action: no action

Cyril Hrubis <chrubis@suse.cz> wrote:

Hi!
> Are there any other fixes that should be considered before the git is
> tagged?
>

No from my side, and LTP pre-release test looks good on our latest RHEL
9/10 series.

I think with the merge of some extra fixes suggested by Petr, we could
make it a release. Better on this Friday.

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
