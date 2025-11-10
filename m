Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A1748C4530E
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Nov 2025 08:18:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1762759129; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=IqsVo/4kDkt05lhrilp/llHpUyyLl8Hek+3K10Ss5Ic=;
 b=kuNLJUnToNNuREoFHdni6kqnZ0XnnVptju6BYN0IHC6ZrenAxf8Dv5aV4FRY7GxNBea0I
 I7aH0Q9FgJD2Z9ACBHZbzXK+PTuYHFU2AdDD004FMEmTJKPFpZSP99tSkWC8r/rZISAZ9Go
 E4s/wR212tcE6nqA75aYxgeRvhtuv0s=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 38E993CF55A
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Nov 2025 08:18:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B51813CA9BB
 for <ltp@lists.linux.it>; Mon, 10 Nov 2025 08:18:45 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 02FAF1000762
 for <ltp@lists.linux.it>; Mon, 10 Nov 2025 08:18:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762759123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LDGx12kT3ZkWcAAFhaZRgq3t5Zyc7me/JExcZgqPE3c=;
 b=HvbWKX5WWiiRaAMayVHy1SQ6p6E64C/d+UTVt/sq5ywmPC9F4ZcvBJ6f6wAO1LNJ3yOzEo
 KKViA0nHy+SAmWHZ4LpdJHOZMFstz1VmMZ71IQF8YGuShiPbCMRCQrzDUA3ZSHHgLUkMRU
 NzVYejZvF5/X2tG6eEdExk7CVerFS8U=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-NBs1ORHCNLynQ0WIWYQ6Ig-1; Mon, 10 Nov 2025 02:18:41 -0500
X-MC-Unique: NBs1ORHCNLynQ0WIWYQ6Ig-1
X-Mimecast-MFC-AGG-ID: NBs1ORHCNLynQ0WIWYQ6Ig_1762759120
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-29809acd049so12317245ad.3
 for <ltp@lists.linux.it>; Sun, 09 Nov 2025 23:18:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762759120; x=1763363920;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LDGx12kT3ZkWcAAFhaZRgq3t5Zyc7me/JExcZgqPE3c=;
 b=Ia7kdK20SgNqaWnyR46QXZCS4NHcnS5+07YkDPNYwiuNh/scUzqjzVqyfCmPMhd/ka
 PJN24L3rFPtic7glekEfTrXklkSrVyxOdphrauqEdIGIvFspqqqaDgi+KAKjIOOeFCJE
 eTML3TLWWXLRt6aaH5jfh004UTeN76SwuqmzLDGc2wHZ1qnwBECXbJNV7qpi7BFngDWg
 w2fNxei/JRWe8g4kS3cR2gjggnRlFPfFYtlvhSl4E0Pn7UuS6+5AmALLmu3JKbxSafsp
 cNUC88oiaG74AeLghd/aqwj9jwogR0/hE6R2n6S1Ye+lca3CiInwDUkyeZm6qLl4pWgW
 5C2Q==
X-Gm-Message-State: AOJu0YxZt2TMDL3bCUbbmmpz3VZxx95kIVIMOq1Tb6G8/1YR2bCfabS/
 SD634s5zoMJn7ETHwZbRtq1puAYrtiX6DqxsGngobGG8/1OadFQk5r3Zb/pCpt79j3DHgo+IQ96
 MKL8YRR3CSDUqOMg53j0hdK0hMdO43qe5xW1JrcaTwyMr2VbfU+61We55hfi4iduu74dGFJcaWn
 v1QhL4Ij9OBlEO8Pey0OoyuQJAnxQ=
X-Gm-Gg: ASbGncsaXXbsBZ5yAO2FEz71ncDNtVeHJsHt/iidO3OPEFa/p1C8++MxRzv+L2rjIXY
 //edrInUPYGPk1gYTsY98Izc2vrpLGEjqQMqpVSLd6PfxngdqNq6huWEnhwb56x9ARpuOMYGKBd
 pMWaWRsE2P0FpB9mHpXJtDYSG0DBdNIwIJ4++gYZQWqavx2gpeWxX5kbhP
X-Received: by 2002:a17:903:fad:b0:269:8f0c:4d86 with SMTP id
 d9443c01a7336-297e56f3743mr81067345ad.53.1762759120226; 
 Sun, 09 Nov 2025 23:18:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYAVZUHuj9glybRCF8rnJliOGbH+1YiXPKwewodmuyb+OY6v2sXjFYwjQx2dlewa48k2bjO1QjeUovBtgs+0s=
X-Received: by 2002:a17:903:fad:b0:269:8f0c:4d86 with SMTP id
 d9443c01a7336-297e56f3743mr81067155ad.53.1762759119895; Sun, 09 Nov 2025
 23:18:39 -0800 (PST)
MIME-Version: 1.0
References: <20251107102939.1111074-1-pvorel@suse.cz>
In-Reply-To: <20251107102939.1111074-1-pvorel@suse.cz>
Date: Mon, 10 Nov 2025 15:18:27 +0800
X-Gm-Features: AWmQ_blHpNRqZQAlMeAPO5tu1I5XTdQB_jcdp-yzSHu01jG2n3_OMRnO7Vlc6L8
Message-ID: <CAEemH2ehiZxKQ1d+q7+eKqC7dqkn4j6bKwUwS_8h0LqZfBVckQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2vWPFqKuGNr9SdODN5A23KgUJVnlRT9ZIQgNqMaIXlc_1762759120
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH 0/8] tst_test.c: Minor return code cleanup
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

Hi Petr,

Nice cleanup work!
Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
