Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPwuCCYSnmlsTQQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 22:03:34 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9A718C93B
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 22:03:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771967013; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=V/Lxn1AagJHPGGlAusu8Ts30IW5WskrSj5o+4G1qJYI=;
 b=WJhaPma00spkr/dAb+mZmF8hf1Z1UgPSoL37TruZmQt9n5oDuMFTdGl4SKENe/645RH7t
 LZZea4/8WUg01Fyw8IBm54HrJFR+X+5EcBKMjAlfvDj8SOKCA24wUipJLU7Nr7xu5PRXX5q
 OdtiRaHhuQJ8Q83Ui0+4dCSN1/VjE4Q=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 38B783CB958
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 22:03:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4A3BC3C54C1
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 22:03:30 +0100 (CET)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A82CE200B63
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 22:03:29 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b8871718b00so1002904266b.3
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 13:03:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771967009; cv=none;
 d=google.com; s=arc-20240605;
 b=aDIhlZeTyFdLQcaiq5becWGqxkpmZqSbOdQgNzYpgHW2sn7AOWX9uBh75QoPUNWux7
 YLe5j8TLC+O3EohrdazpOsdfZKJtnSQ5IEBq6AaT/agkISMoMpoMok1qI9q2aCmsy5u+
 S4nUub1altM41h0YlNNNtuLkL5jX672jN19t6skbChQw+DeiX4KXTOsFImv269XygPoY
 18F+XcN+rNB00Jy4uJ1JPpyiplSqyzLd9AGKbtse2/FHipe0ICcwQ3JGwg02xYXbl9ck
 hJW7zqXd9pG8A7aaQNHkHpQnSCGeVMpEci4gmvkPjj/NhHsPdafj1xm6uWAirktbt4X2
 ttAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=IRpdZDe35Co4SZu86g9jBR9OWToftqc9EqOGHyCaEb0=;
 fh=bpgMwdhj2V5dFHhBya/LAx01zapCp12LRM5OHjvBEmU=;
 b=Cw8QBaPzEiPgfkBGn5sRWuiDZdr23kw72YJN6pIgGKF9QXZytPpUGKpeQRFSlm3+eq
 +eHFh4nmQVwDBI9n2JJ89qUWM1EnX+oLpf1QyLDZ3Gr/iWbAlzXKk0pY8yOs3SI5YTBr
 gmHyKxuQgKOHIeF0msM03YkcQ3wWfO6EPHeMBgDB6uMoy/lg35zuIsxSbBQ9jMd+9/Gk
 WXRcmIkSXTKoAyhP4cWzHQYOJ7Onvs4FRioYH/gPYnycFynGQvKJAbId4GJSIQZAjiUt
 d+Wz2EHMj0Tx4mdBLIUHcf6YM3EDMUVC+BmQPsWjaPXwPWUghmUJPJIbh8DBK7sZHoRa
 4XQg==; darn=lists.linux.it
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771967009; x=1772571809; darn=lists.linux.it;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IRpdZDe35Co4SZu86g9jBR9OWToftqc9EqOGHyCaEb0=;
 b=GVx4Q8Iqg3f+Dn3E55tIyi40/hXdwtS2WuR9q51d2kcoi7V2avB/UJUlNJrEB5Erm+
 tDXWSkEZVJqMbjBLMfPUVri9ww6LHWq1k7iZxyopNpuaKf5UzpJRDlZYsanmmBJ++vpk
 6P0myU4fTiffBGwSkqMnTivG69lzNCnHTifhXYURMJTaPIVUW2CZhTKKP4qgZDR4f80M
 ybhYwrj6f+vlS0UJnR+EmptG6AouQbJNXUk6o8lAU9xKcSqhbxqHdF9IUS0u6gNEHC1A
 AMg5BvSz6MGVqGDpeUIIUwvnMIsCG58vUqLQePgzvnmV6J+TudJAM4jR2BFuTqk8O6MQ
 q4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771967009; x=1772571809;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IRpdZDe35Co4SZu86g9jBR9OWToftqc9EqOGHyCaEb0=;
 b=KVFD45xKqZ6blshvZGbIdt1Q+b05hAGXgvfQAuDfDsZtuWD3DzyMu9DgU9opu/j7Zz
 /hBdHT6DMi+T6m0QzT2syNQdoK6eW6ephBYtDpxvR4MqezI1pIp8USxXjEF7vgm/fnBx
 ALO9oE/7h4beLMLiKwBNvHs/8HaWrC89ih4bAwB9E1SsEYNBsNaXJmrV3I1VgPSgZzE5
 JPR1ZsrFH9u+MrjFTABSLbG/dolgb9vSadqELJKJulckgpAOnWkR2wdHheHEQIdh+sTm
 ZEHYSpiHuMSjeQgrKy9p3TWdq1GPCFE6X9LCvlD8Ryz1XEdGPllmXtTE+SEjmC7pbqLs
 RWZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4JY6I/+MaFs/rdmpU/dWW7IIhhGdw3JYJzuJ482kZLlzWeuMzkWptV4dm6BKUoSibE+Y=@lists.linux.it
X-Gm-Message-State: AOJu0YybIShjO3AvRkb4OVztbOj1A4ZF0V4LJIoOKCAZKzO2mtt8VBg3
 tBTsgJkmzh5jfHEBFjrXSvoOU1lnBMh2/u2ItHMM+Et/6aoWLMYU8+TAA+SXgle5uqcen+cBB2Q
 4zRpn0n4x3MvO0MUatoVzYc2Dq3ct2Ry6n++VMIk=
X-Gm-Gg: ATEYQzw1wWTMQF9tMBLwcoY8Laf6S1+zKTBCnsU2zx0PaKdErYkn472kYfjDmKju6bt
 fkFWycLaHD3PFe581fGT8aNPt6WnkxIH0yfEw8WP9AxUQFY8UQqIOSEjfKX73uheo0AuSSxNiX2
 nRWkeSakKgkkTBVNTgQYVYJVS4SZ+LDCPazLihJE242ONMcMmAyJaurBUoocOK76obzBpMVn3TS
 b/RN7c8gB4MeSf0sz/+aY5V2FXpUUjSqCtSGKw/YhDramx5Tvq1yWQDGpHB3MZnPFYarFrmAFVl
 h99vsCjPeslSpswyLq8/IRnG2zkGqaM9HTsA
X-Received: by 2002:a17:907:84b:b0:b87:701d:341a with SMTP id
 a640c23a62f3a-b9341bcd089mr3614466b.25.1771967008639; Tue, 24 Feb 2026
 13:03:28 -0800 (PST)
MIME-Version: 1.0
References: <20260224104544.101292-1-japo@linux.ibm.com>
In-Reply-To: <20260224104544.101292-1-japo@linux.ibm.com>
Date: Tue, 24 Feb 2026 13:03:16 -0800
X-Gm-Features: AaiRm509ORQkGVsU3If4PPB-dIpfByRWpB4Vg43k6I7vpcXQiSztqHCnMd_5BVA
Message-ID: <CANDhNCrrZY=5bvRQGGJsigjwRNmDz8shbtM-Vtn5UkdRDGU_uA@mail.gmail.com>
To: Jan Polensky <japo@linux.ibm.com>
X-Spam-Status: No, score=-14.9 required=7.0 tests=ARC_SIGNED,ARC_VALID,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
 ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
 USER_IN_DEF_SPF_WL shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v1 1/1] sched_football: harden kickoff
 synchronization on high-CPU systems
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
From: John Stultz via ltp <ltp@lists.linux.it>
Reply-To: John Stultz <jstultz@google.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Linux Test Project <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.11 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	R_DKIM_REJECT(0.00)[google.com:s=20230601];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,google.com:-];
	RCPT_COUNT_THREE(0.00)[3];
	HAS_REPLYTO(0.00)[jstultz@google.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.linux.it:dkim,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: AD9A718C93B
X-Rspamd-Action: no action

T24gVHVlLCBGZWIgMjQsIDIwMjYgYXQgMjo0NeKAr0FNIEphbiBQb2xlbnNreSA8amFwb0BsaW51
eC5pYm0uY29tPiB3cm90ZToKPgo+IFRoZSBzY2hlZF9mb290YmFsbCB0ZXN0IGhhcyBiZWVuIGlu
dGVybWl0dGVudGx5IGZhaWxpbmcsIG1vc3Qgbm90aWNlYWJseQo+IG9uIHN5c3RlbXMgd2l0aCBt
YW55IENQVXMgYW5kL29yIHVuZGVyIGxvYWQsIGR1ZSB0byBhIHN0YXJ0dXAgb3JkZXJpbmcKPiBo
b2xlIGFyb3VuZCBraWNrb2ZmLgo+CgpJJ3ZlIG5vdCBoYWQgdGltZSB0byBjbG9zZWx5IHJldmll
dyB5b3VyIHN1Z2dlc3Rpb24gaGVyZSwgYnV0IGl0CnNvdW5kcyByZWFzb25hYmxlLgoKVGhhdCBz
YWlkLCBJIHdhbnQgdG8gd2FybiB5b3UgYW5kIGVuc3VyZSB5b3UgYXJlIGF3YXJlOiB0aGUKUlRf
UFVTSF9JUEkgZmVhdHVyZSBpbiB0aGUgc2NoZWR1bGVyIGJyZWFrcyB0aGUgUlQgaW52YXJpYW50
CnNjaGVkX2Zvb3RiYWxsIGlzIHRlc3RpbmcuCgpJIHNlZSB0aGlzIGFzIGEgYnVnIHdpdGggdGhh
dCBmZWF0dXJlLCBidXQgdGhlIHNjYWxhYmlsaXR5IFJUX1BVU0hfSVBJCmFsbG93cyBmb3Igc2Vl
bXMgbW9yZSBpbXBvcnRhbnQgdG8gZm9sa3Mgd2hvIGFyZSBkb2luZyBSVCB3b3JrIHRoZW4KdGhl
IG1pcy1iZWhhdmlvci4gIFN0ZXZlbiBhbmQgSSB0YWxrZWQgYXdoaWxlIGJhY2sgYWJvdXQgc29t
ZSBpZGVhcyBvbgpob3cgd2UgbWlnaHQgYmUgYWJsZSB0byBkbyB0aGUgcHVsbCBpbiBhIG1vcmUg
ZWZmaWNpZW50IHdheSB3aGlsZQpzdGlsbCBob2xkaW5nIHRoZSBpbnZhcmlhbnQgdHJ1ZSwgYW5k
IEkgaGF2ZSBhIGJ1ZyB0byB0cmFjayBpdCwgYnV0Cml0cyBub3QgYmVlbiBoaWdoIGVub3VnaCBw
cmlvcml0eSB0byBnZXQgYmFuZHdpZHRoIHlldC4KClNvIHlvdSBtaWdodCB3YW50IHRvIG1ha2Ug
c3VyZSB5b3UgZGlzYWJsZSB0aGF0IGZlYXR1cmUgYmVmb3JlIHRlc3RpbmcgdmlhOgojIGVjaG8g
Tk9fUlRfUFVTSF9JUEkgPiAvc3lzL2tlcm5lbC9kZWJ1Zy9zY2hlZC9mZWF0dXJlcwoKdGhhbmtz
Ci1qb2huCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlz
dGluZm8vbHRwCg==
