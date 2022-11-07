Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8206C61E8BC
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Nov 2022 03:59:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A9B93CDB6F
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Nov 2022 03:59:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 27E9B3C039E
 for <ltp@lists.linux.it>; Mon,  7 Nov 2022 03:59:10 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D3C4010006DB
 for <ltp@lists.linux.it>; Mon,  7 Nov 2022 03:59:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667789947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pq+6xxe9tjGnWR1/TEoyZHxBMhyNRYbkWi//Bu0BjNc=;
 b=cLTAx/V7Qiaij4jogC3ni+E7AYevH1dUBotH7P02JmEum1ve6E6TdOBDbJtIb2uzl4bvBa
 XjjxhSUP9k5uypDk5CD85CXyHRwkVvhasno4mZEw6IfgrofsmaLYrpXPftizLAJIW+rx4g
 gEyq4YVakwlAHI4zsI1EoOlQiZXTMxc=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-580-sVQbeIFEOwS3wqvkkCCz8Q-1; Sun, 06 Nov 2022 21:59:05 -0500
X-MC-Unique: sVQbeIFEOwS3wqvkkCCz8Q-1
Received: by mail-ot1-f70.google.com with SMTP id
 cy25-20020a056830699900b00661acac3847so5064810otb.17
 for <ltp@lists.linux.it>; Sun, 06 Nov 2022 18:59:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pq+6xxe9tjGnWR1/TEoyZHxBMhyNRYbkWi//Bu0BjNc=;
 b=hS2XtZWr01hGUZNLX4whznmZb2qlrt6X9l/ZULQUXiRtYsUHz6iw9YgOVU1L4F5hxf
 G1es0eeWN2cSbqRATU9td4MV5I5+sxZB2Ntcv8q/MQrf4ITBsIztFXYQ6TRdRAlv4UzE
 LOWNYEsz+8/CyMcNMECUnv7SXYzwAsOdz1Ndajkmhjt0j2IZzQMZbLCdnF82KE2XbGRO
 axS+9qgTJ6+DQAEzRcATAaGph5Pk0gObnAB+K5G7+CZHW8vokjhcEaJx4+cJrOnJBVi0
 b1GvfGWt6gyA5+TTlRcXznEyGnYidEWRSJYFQ5FuXyO1AgsRcMYfs6gOtMC8Q74ddvfb
 49iw==
X-Gm-Message-State: ACrzQf1newWvZlW+RdoYHbXc0peUGJwIATjJ4aDoDgSnV//E8os6VhSw
 zwDtolqF0NRO0xKNIW0ifzETIA/59pOoktML0KBP4pgBEvzq35x1+K8N9DgZUe155CXNvRvHkXs
 1Vj/91FXRyfZJX7urxLTvIrsH4Dg=
X-Received: by 2002:a05:6808:14c9:b0:35a:7106:e036 with SMTP id
 f9-20020a05680814c900b0035a7106e036mr5161458oiw.107.1667789944557; 
 Sun, 06 Nov 2022 18:59:04 -0800 (PST)
X-Google-Smtp-Source: AMsMyM69G+RNjsGhWK25lxy10ZqypBluA0Q2d5XspP49KrWc8zFfXb9gRzV+0jkE+lE73aUBl029JJ6JgmNG5xWlkbk=
X-Received: by 2002:a05:6808:14c9:b0:35a:7106:e036 with SMTP id
 f9-20020a05680814c900b0035a7106e036mr5161440oiw.107.1667789944282; Sun, 06
 Nov 2022 18:59:04 -0800 (PST)
MIME-Version: 1.0
References: <20221104162511.28658-1-tsahu@linux.ibm.com>
 <20221104162511.28658-3-tsahu@linux.ibm.com>
In-Reply-To: <20221104162511.28658-3-tsahu@linux.ibm.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 7 Nov 2022 10:58:51 +0800
Message-ID: <CAEemH2cj4uSEAsc-+h0YHf_Gjh81q5rp79TPD86kJv6qB+u1FA@mail.gmail.com>
To: Tarun Sahu <tsahu@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v8 2/4] Hugetlb: Migrating libhugetlbfs
 brk_near_huge
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
Cc: sbhat@linux.ibm.com, aneesh.kumar@linux.ibm.com, geetika@linux.ibm.com,
 vaibhav@linux.ibm.com, rpalethorpe@suse.com, ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============0609934525=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0609934525==
Content-Type: multipart/alternative; boundary="000000000000307dc105ecd89b20"

--000000000000307dc105ecd89b20
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Li Wang <liwang@redhat.com>

--000000000000307dc105ecd89b20
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div dir="ltr"><div class="gmail_default" style="font-size:small">Reviewed-by: Li Wang &lt;<a href="mailto:liwang@redhat.com" target="_blank">liwang@redhat.com</a>&gt;<br></div></div></div>

--000000000000307dc105ecd89b20--


--===============0609934525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0609934525==--

