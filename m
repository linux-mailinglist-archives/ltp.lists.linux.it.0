Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MdkDzC2eGlzsQEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jan 2026 13:57:20 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DB88394937
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jan 2026 13:57:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769518639; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=K0VUm646qtyZZUirEpnCMaomjLN3LGtXd8aAg4Yc3qU=;
 b=aja8BQJ3SDokNZgN+dySn3EkQeteYvodXMg6hiV4tjllssfmt0vPdwdkXH4z9M4Bb3SBc
 oCo6IzcM4e4kDNGUV/XKGWvU3gW0Aw0kypWuc1TeG5G1dsW+Oh8XEmr/G0kzNU4+SdKGpAy
 amjLj6a+VeExQGhAlvemkoqwuX5WNv4=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7BB023CA521
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jan 2026 13:57:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 426253C9BEC
 for <ltp@lists.linux.it>; Tue, 27 Jan 2026 13:57:06 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 97EF81A007AE
 for <ltp@lists.linux.it>; Tue, 27 Jan 2026 13:56:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769518618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TD/zIKSjU8unlZR1Q2RYXOVmnEhY/PHulk37uCL0SBg=;
 b=S5+CnkYGCk58AhYWEoGMtWB0hZ54+ofNOPqwBLFfDzTw72kzuHqFGPNMkj+V1pzY3Qi7w0
 y/jyHeEgIqDQd1pOkQhn3Zt//DH7kzIstr3Qm7IERxZWz5JXeyIGN1JxZ6S/Auqp1LWdh4
 S9AQ5CHpFue7TEzPwpEWfpvXGz2S5i8=
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-3BlSW6lAMpmtPv6Rw92xYQ-1; Tue, 27 Jan 2026 07:56:57 -0500
X-MC-Unique: 3BlSW6lAMpmtPv6Rw92xYQ-1
X-Mimecast-MFC-AGG-ID: 3BlSW6lAMpmtPv6Rw92xYQ_1769518616
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-2b71c5826fbso5979532eec.1
 for <ltp@lists.linux.it>; Tue, 27 Jan 2026 04:56:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769518614; x=1770123414;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TD/zIKSjU8unlZR1Q2RYXOVmnEhY/PHulk37uCL0SBg=;
 b=G4DMynBmH6dEkbQ6vJIEZRKbgKT7xZX3EPceul04MxoBeVtcwxUiFN/EpG/GEg1Hby
 dVhu2HZtLvmcxP33GmQMPKm+b1adO6PzwM4w35ijWiXOja6sRdHXwsjfsEAHv5gNDASE
 eKYlWZ713VKNP6kqVPE1iWRVsQ00jW+sLqywUjGDu95GUap9svL57fbRKu1dyWE/L6Q7
 ypXJG3iYRp/RWiaBJq0B44AEoid3Iq6J1aH+Ln5P4aU1RCIQZ2J49GSK6RV0bw7eal/O
 WgM0zsx8ISeJapmPbsbTU6b5GkAHHtik/pbqzGKznE10thUQ39RKYCYbVcaZvUB6Gaem
 80kA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwD0JX3azMilGfcK7aG9BaPg5CB/CjmISbuxjyxtw2iRUDUKlD/q9WwaTUHDnBLhynaL8=@lists.linux.it
X-Gm-Message-State: AOJu0Yz7N+tQ+G7TutGGrT1tl1vZLAz29nwxK9eSpRQC1HwP3+dbf1S7
 Q8lWMTVK8NfLooKlXuBstgh+Es4pEq7MOp+5EH7cuQ8srx30VatC8lHyXxJDb7bQUhvGwLzEHsv
 FfFjHeIvE+mR8F0BpxLWW96JEHp7+tUiEYw+2eINlxaogR9wNkSfiur7RGZzi8BDho5x0StlBNn
 MUQIl2ce/ZegAPa/N8cemXduCCXGn5tROpINQ=
X-Gm-Gg: AZuq6aII0/SSx6/9xurP//HOTPfASzurj+APUKTtrn5TFObFPwlqz/6gqP2KqHVcsaT
 ChNiJDCoJmryYnBxNxN93TVZx3/A/nswxYVlxVhRE2JNLAeqK1YqkQTuzM934YwTAUx5M0tjMD4
 8d1xkSVpWlhtFVwr0x6M658ubHcQbM42SkxpKKlxiWFrxt+jmRb7e97dCzKMwiWnbepa4=
X-Received: by 2002:a05:7300:d512:b0:2b7:30a4:8ce6 with SMTP id
 5a478bee46e88-2b78da36be2mr1137528eec.38.1769518613964; 
 Tue, 27 Jan 2026 04:56:53 -0800 (PST)
X-Received: by 2002:a05:7300:d512:b0:2b7:30a4:8ce6 with SMTP id
 5a478bee46e88-2b78da36be2mr1137516eec.38.1769518613586; Tue, 27 Jan 2026
 04:56:53 -0800 (PST)
MIME-Version: 1.0
References: <20260122175354.83833-1-pvorel@suse.cz>
 <DFYE2B8PCNRI.C7NK5PJU4YW6@suse.com>
In-Reply-To: <DFYE2B8PCNRI.C7NK5PJU4YW6@suse.com>
Date: Tue, 27 Jan 2026 20:56:41 +0800
X-Gm-Features: AZwV_QjY4rmSvzAx_xgqlkCOqDGs4pi3DlyM3myll-HoVfmJ59uHChikO5bgtlw
Message-ID: <CAEemH2efyxZuJsnb5-P51VyyFbaS-pPFxVcsLLiZ9v9Tx_Fj-A@mail.gmail.com>
To: Andrea Cervesato <andrea.cervesato@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Yn9YOYIS8PRAIKT1MybUJywibvd_P2s3ZkIPYYx7sHg_1769518616
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH] lapi/tls.h: Cleanup ifdefs
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
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,picard.linux.it:helo,picard.linux.it:rdns,mail.gmail.com:mid,lists.linux.it:dkim]
X-Rspamd-Queue-Id: DB88394937
X-Rspamd-Action: no action

Merged, thanks!

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
