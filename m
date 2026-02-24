Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHUsIppznWmAQAQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 10:47:06 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F0A184E63
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 10:47:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771926425; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=twFf+0OkdUIEIGWD8e95VlKra+Kq1m9kaN5DBH+rGc0=;
 b=ctrKd/5NCXvWCNyfVNe12M6hL8jbgJGnlRDN7+P2CBfnTA64pOg342QelpP3N+2tW/GED
 eKzv5KbynZw2ORPm/tkYfGRZNRnVrQ+zxCPwQAVVxUxl4EFofo9XZUfFtNBJjKbSrsyHOjS
 O865PH/Cu/NMxiimqCgdmtpCJtWLD2Y=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B3DD53D0F8C
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 10:47:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 748533C8445
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 10:46:54 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 956041400455
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 10:46:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771926411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m/FXABcOY+8d/Mh0WMTnQarElPyYZYlqxoseGESanu8=;
 b=YwuU17gXb/3GTPxfL7G5kjQup3PW0SU1AeKrFb4VMSyR8QGQSznjSB8pwqUPn/PRz4opmX
 N9cQ4pZGN0XzN3cFd64ADLXmaAqCat1NaBJbEIm4p1KqmIi6fciw865gU+qnne74OTyeXq
 hi2pErBJhbsGvo5dsXz6nEFZSbHxqak=
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com
 [74.125.82.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-7PAni6kIMcOwQIoRaJzNmA-1; Tue, 24 Feb 2026 04:46:48 -0500
X-MC-Unique: 7PAni6kIMcOwQIoRaJzNmA-1
X-Mimecast-MFC-AGG-ID: 7PAni6kIMcOwQIoRaJzNmA_1771926408
Received: by mail-dl1-f71.google.com with SMTP id
 a92af1059eb24-1249d001040so2967075c88.1
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 01:46:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771926408; x=1772531208;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m/FXABcOY+8d/Mh0WMTnQarElPyYZYlqxoseGESanu8=;
 b=J9ah8Rvw45lqJ6ppYLLJG6ODgX6TyxgRW810ejX9O2AGNMJ+jOUup+0Tqg5ShSGfdm
 0PB7o49wAQUEig/a7VyYMZaiTixaYcX7A25pLp5qoMtt5Xd0gWa6TfF8BjT69TvnIeIW
 NGAjMROScT915d7sSoaBson+QsT8C7lPx9V9q1F6bKZuTWVrTVKedqZ8LS0Tua9ZP22R
 WM+98M8uSTwNOAth9TgsMeLMZgdFhjIAJG0/9oBNftId9vy4pQxCqJrgstjXSkLcJVKy
 76JnLfLQHfPkuJDAgm5bBCX4kPQqulrI0bohGvdZX5/5CFTR49NrRu0IHPiJl4NQpHW+
 zU3A==
X-Gm-Message-State: AOJu0YxX5lgsgQ4h/e1lxl6aopOAcAqbcoAHmagmofaLJPBl5855+iT6
 WZQdxaf24je/m8gxFKqIHynMRbjaalK2RRvG1SH8GkvaccvU/d2US1H3PNhFEuqgtJ/E1V+3msO
 YEqVoL6Dam/LzBk2Qsuhypmg4gOwGP13xBanK0WuAlGlkHMRXiSqnu010PmB3IdOygnSdNimrcQ
 ZrlJn0v/hE9h2G5dUYAMa7h99hF+8=
X-Gm-Gg: AZuq6aI+UybepE+SOUrMezzX2AUFEyWu7uGaC543kxAgFJgrrPgMHWld4knnFsNHf1v
 oZ2ryAAI/nDO5par5xTzJTbm91YiYSyiWPNDBJdnx8uzg5w1jPxb3xZYAdU6kN3kCT0HYREf+wb
 6V94RC5yOcI00LQimOgUX/qA7ajiqg15PJI8g7us2zkvP7Z0qZAVzAy2kAV0TufnN7oO4IbHHtp
 /shvvw=
X-Received: by 2002:a05:7022:7a0:b0:11b:c86b:3870 with SMTP id
 a92af1059eb24-1276ab58303mr4689469c88.4.1771926407680; 
 Tue, 24 Feb 2026 01:46:47 -0800 (PST)
X-Received: by 2002:a05:7022:7a0:b0:11b:c86b:3870 with SMTP id
 a92af1059eb24-1276ab58303mr4689465c88.4.1771926407170; Tue, 24 Feb 2026
 01:46:47 -0800 (PST)
MIME-Version: 1.0
References: <20260224-kirk_4-v1-1-6f706363fc4d@suse.com>
In-Reply-To: <20260224-kirk_4-v1-1-6f706363fc4d@suse.com>
Date: Tue, 24 Feb 2026 17:46:34 +0800
X-Gm-Features: AaiRm53n6enxMdbsGVWqlV5mJ3MaI40u6pwu5hgxhefatLREpIMhIxpyRXpYHEs
Message-ID: <CAEemH2eEkcA32v9piauX2GyefbkBDcDzjixEo8sptBzP5p06Dg@mail.gmail.com>
To: Andrea Cervesato <andrea.cervesato@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3AsGZRXDLbzyOanexk_Ln_AE8q1TaWyQqHhcOJxcY-E_1771926408
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH] kirk: version 4.0.0
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
Cc: Linux Test Project <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.11 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,picard.linux.it:helo,picard.linux.it:rdns,linux.it:url,suse.com:email,lists.linux.it:dkim,suse.de:email]
X-Rspamd-Queue-Id: 30F0A184E63
X-Rspamd-Action: no action

T24gVHVlLCBGZWIgMjQsIDIwMjYgYXQgMzo1M+KAr1BNIEFuZHJlYSBDZXJ2ZXNhdG8gPGFuZHJl
YS5jZXJ2ZXNhdG9Ac3VzZS5kZT4Kd3JvdGU6Cgo+IEZyb206IEFuZHJlYSBDZXJ2ZXNhdG8gPGFu
ZHJlYS5jZXJ2ZXNhdG9Ac3VzZS5jb20+Cj4KPiAtIFJlbW92ZSAtLWVudiBvcHRpb24KPiAtIHB5
cHJvamVjdDogaW5jbHVkZSBzdWItcGFja2FnZXMgaW4gcGlwIHBhY2thZ2UKPiAtIGxpYmtpcms6
IFByaW50IC9wcm9jL2NtZGxpbmUKPiAtIHVpOiBzaW1wbGlmeSByZXBvcgo+IC0gbWFueSBidWdz
IGZpeGVzIGFuZCBjb2RlIG9wdGltaXphdGlvbnMKPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJlYSBD
ZXJ2ZXNhdG8gPGFuZHJlYS5jZXJ2ZXNhdG9Ac3VzZS5jb20+Cj4KClJldmlld2VkLWJ5OiBMaSBX
YW5nIDxsaXdhbmdAcmVkaGF0LmNvbT4KCkxpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC10
ZXN0LXByb2plY3Qva2lyay9yZWxlYXNlcy90YWcvdjQuMC4wCj4gLS0tCj4gIHRvb2xzL2tpcmsv
a2lyay1zcmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2tpcmsva2lyay1zcmMgYi90b29scy9raXJr
L2tpcmstc3JjCj4gaW5kZXgKPiA2YWMyNjQ0ZTZlNDY5YjdiYzdkZGYzNWE2YjEwYmYxOTk0Y2Ew
OTI5Li42YjBmODdjNmRmOTBiODdhOGMzMjY0OGM5NDE2OWE4M2I0ZTU4MDI0Cj4gMTYwMDAwCj4g
LS0tIGEvdG9vbHMva2lyay9raXJrLXNyYwo+ICsrKyBiL3Rvb2xzL2tpcmsva2lyay1zcmMKPiBA
QCAtMSArMSBAQAo+IC1TdWJwcm9qZWN0IGNvbW1pdCA2YWMyNjQ0ZTZlNDY5YjdiYzdkZGYzNWE2
YjEwYmYxOTk0Y2EwOTI5Cj4gK1N1YnByb2plY3QgY29tbWl0IDZiMGY4N2M2ZGY5MGI4N2E4YzMy
NjQ4Yzk0MTY5YTgzYjRlNTgwMjQKPgo+IC0tLQo+IGJhc2UtY29tbWl0OiBmMDYyYjM0Nzg1ZGIx
MjFjODQxZjJmYWVkODIzM2IwOTQzY2RmZjI3Cj4gY2hhbmdlLWlkOiAyMDI2MDIyNC1raXJrXzQt
ZWI4YjdhMTRlOGMyCj4KPiBCZXN0IHJlZ2FyZHMsCj4gLS0KPiBBbmRyZWEgQ2VydmVzYXRvIDxh
bmRyZWEuY2VydmVzYXRvQHN1c2UuY29tPgo+Cj4KPiAtLQo+IE1haWxpbmcgbGlzdCBpbmZvOiBo
dHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo+Cj4KCi0tIApSZWdhcmRzLApMaSBX
YW5nCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGlu
Zm8vbHRwCg==
