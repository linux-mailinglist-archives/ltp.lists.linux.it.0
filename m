Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GI1zDy1pgWmwGAMAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 03 Feb 2026 04:19:09 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CF65DD40D1
	for <lists+linux-ltp@lfdr.de>; Tue, 03 Feb 2026 04:19:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1770088748; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=++YqDMWPLu8izpKfUAN4vAvzbr0gcLbDgd0m9XEJ7SA=;
 b=G1kr3EV/E/1MXNqC9KKYwfB5uCl+4tSp73AqHfpxl/pjVgnUH7GCSOtSGh/5DjpP3PIcW
 DNO+wJPUB64/siCPJ+J3MGI0Ea2tAxMfkX2KBuLIF7nqnwVDhDgYki32fhvSrW2deJrYYcH
 evQppoOjZyrmhPLb+hjPiEmmEaxE/GY=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6D0893CCFCE
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Feb 2026 04:19:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 84EFA3C9CCA
 for <ltp@lists.linux.it>; Tue,  3 Feb 2026 04:19:05 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D639560085E
 for <ltp@lists.linux.it>; Tue,  3 Feb 2026 04:19:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770088743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EJzf0AeGtUrYqZKYSJ849/AvKLCcsMib7l2aTp1ALBw=;
 b=hriD1a8PL8cLx3tB/m2Ocwc97vFQr40agGfY4ihUsbQ92DiRFRSwG6TKg/9VmfcaerOOFQ
 hdX5XP9UmHNQOJcnUWOupgVFvwLHSobKhu4FHZGFczZqBhQOrm9m0BPh1e94fsbc3mKlMw
 h0HZW6nlfOK8TfvbmI/2yksF9aJaRUk=
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-KUk0GogAMiOyjAaO6Bt-1A-1; Mon, 02 Feb 2026 22:19:01 -0500
X-MC-Unique: KUk0GogAMiOyjAaO6Bt-1A-1
X-Mimecast-MFC-AGG-ID: KUk0GogAMiOyjAaO6Bt-1A_1770088740
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-2b75222e9easo9943672eec.1
 for <ltp@lists.linux.it>; Mon, 02 Feb 2026 19:19:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770088740; x=1770693540;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EJzf0AeGtUrYqZKYSJ849/AvKLCcsMib7l2aTp1ALBw=;
 b=enK3DIcF5sWxpGLz6QhA8Fk1JhBWVJ7z3DDd1N3ynbJ3MYQGkQ8k5hvW1FOt05MC+b
 3vI6g+TDLzw84oEmKiK0FL8WizJEQ8kiUbJARV00u1d1xawSrr81smYbZyWv00JdElg8
 uaGgNPifcBkyYkI/A/McX516eQEhLhWsm5Rer/zqV7Xxe6mf9+2F9OgICpuZ0vo+cQ7w
 YWMuOA3a5LkbIyRIFm3o/Ey7NDBW+YPIDt6YLL8hVZst0rGE/9KKlbOEWKO8NnpOVDyT
 GjgSJO7JQEeIu3jY4iemymstu+gZnTvhirjxI3yllEqCYctldBAB7cM2CjoYoFfJrSer
 e81w==
X-Gm-Message-State: AOJu0YyAJlizH/a0QK+/27Hry1e+2jJlsrjzqhgBxAiJnuBg8KWqiFbb
 c82FOqf3/gi0FJ+rNe+7lka1BTHbNrMcuMHzgmp9omxDyT320UjCYwVwOBn2TpaivNiSoI+dtFr
 7wjqcO8uZL7lIgtA481KlNbRNS/V605j3DwBxm1hyzPUZX4U49LURyKDNedw4HbljSQZvla1YPs
 WHat7PDeeN7syWMzpXThHxkPuZzp0=
X-Gm-Gg: AZuq6aL6DAa5Usfv2nZEhk0CWzbOMtGpsKkBzuIkyHEjJpbn17i3Z+v+glu8RS4KIZY
 wLk4r1d/w2HgKy38ZSuKy5TStQqCrqZ8fHt4LO8+8ACuBYZlvy/69FR+vz3zMfXmRwCoIU53tad
 rOJSP+ftnPG84NX1BwGMNLEw1mkEjlY5KNGxy+Bcg5Z4E6XObknGejaABmH38P/6r5y7w=
X-Received: by 2002:a05:7301:100c:b0:2b7:2f29:648c with SMTP id
 5a478bee46e88-2b7c8634921mr5838047eec.8.1770088740280; 
 Mon, 02 Feb 2026 19:19:00 -0800 (PST)
X-Received: by 2002:a05:7301:100c:b0:2b7:2f29:648c with SMTP id
 5a478bee46e88-2b7c8634921mr5838038eec.8.1770088739894; Mon, 02 Feb 2026
 19:18:59 -0800 (PST)
MIME-Version: 1.0
References: <20260203022719.226064-1-liwang@redhat.com>
In-Reply-To: <20260203022719.226064-1-liwang@redhat.com>
Date: Tue, 3 Feb 2026 11:18:48 +0800
X-Gm-Features: AZwV_QiQO2DCBqOPnFbWG-uwPCgsqB40XdN2dpu33tOf_UFp3lDbl_6sJk15yZY
Message-ID: <CAEemH2dk9zpZOGjkhEOAa70qxYe3y4CrPoLPwFrZ60_EY18vvA@mail.gmail.com>
To: Li Wang <liwang@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fszIDcEYZ-PTCPaxz_UsRcVAkb8LtoHd5GjjgKmy_mQ_1770088740
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH] openat2: define _GNU_SOURCE and include <fcntl.h>
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
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns,linux.it:url]
X-Rspamd-Queue-Id: CF65DD40D1
X-Rspamd-Action: no action

The binary file was added by accident, please ignore this one.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
