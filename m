Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C17A2CA2AE
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 13:31:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4BAD83C4F9B
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 13:31:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 97A143C4D08
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 13:23:10 +0100 (CET)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6AC101400138
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 13:23:10 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id f9so3711747ejw.4
 for <ltp@lists.linux.it>; Tue, 01 Dec 2020 04:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=lJ6FvawkGbd2QVEYahXsjeQGIAi5iIP/59XdpRAyMRY=;
 b=rzzz3/+ALr3KmjxivncesO2F1uLSW+TGxPQA4IhWbKG68SScW0r6mIB3giCPfmSLz2
 hhFOZauC+hZtU1H9Fz5pS1ME8TqpBouiPbUd0lg11kpzeCMoBypLROwrRfdYczNs7mCb
 A+nQKdwuXr7unt4juys3oSpw4jTnTHdugsYH5fLsIIC0JUNBY800RHzf0Y1CaeoncrI+
 3haqYQhlkadXhvVVJ7UaqZ/s0lR9icew08/rA0KQ0TiWxTsZxgNnML6VxsdeHXoD4j5J
 /XH9BZH8H9CFxpQm3ncjzgAoPoCk3r8qnLd4L962C6RdNFIVWdMivpwHoezZ84he7dVC
 8JQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=lJ6FvawkGbd2QVEYahXsjeQGIAi5iIP/59XdpRAyMRY=;
 b=MvMOLGwx/5sAlat6NyMgD63VH9XW488Gyg0DtagK/+zo3e6aYbnSuMnFLTjB0TqT1a
 1Tx5sECBtv68hdtgX30Ir0lDwuaI0MF+MOlgtH0iy9VF+0FFCEk9YLQp39A7MFlh4At2
 NQmeUxvgTgIin+STVSVOqw5/uecXhHUbDZPXE9LfryHBVgVz0cZCQsaa/chP2wGw0shE
 3W0Ird2p6tQeFabOut61q8K9bFvPpO5LqFibVqE5ezHJxasdE831cZUJ6MjwJDPPXIPx
 pGq4/fV2aZwGUH2LnUGZzL+wCWH/ZckrmcciEpjWvZrWH1W9w1z3ohTzX1FtTrHKJ8sa
 YXBg==
X-Gm-Message-State: AOAM531zNJFV1yVuZ0wb8RygEZBYD0zxMpHRAFIQ62sH6OgxKeDSW02z
 1+FWj8iNwrRqAchXdWo2rq+x5RP1GgJGI3DM+XVppYnUllLAAg==
X-Google-Smtp-Source: ABdhPJwh9RE9aBt1QaiwmycnG+HRkMqGF0yTOdO9qacpWcc43XTAK6HOB6Vkg/ZsLUeRDrayDtDAXwj7nYVAA26wHhk=
X-Received: by 2002:a17:906:4881:: with SMTP id
 v1mr2613909ejq.465.1606825389858; 
 Tue, 01 Dec 2020 04:23:09 -0800 (PST)
MIME-Version: 1.0
From: Peter Gubka <pgubka@gmail.com>
Date: Tue, 1 Dec 2020 13:22:59 +0100
Message-ID: <CAPeFc=TgA6ABrvDthLBoruqfmopx5nhqYYDAv7h0B+CjaFY-CA@mail.gmail.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 01 Dec 2020 13:31:18 +0100
Subject: [LTP] linux kernel versions vs. ltp release tags
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
Content-Type: multipart/mixed; boundary="===============0528521067=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0528521067==
Content-Type: multipart/alternative; boundary="00000000000094251405b56630cb"

--00000000000094251405b56630cb
Content-Type: text/plain; charset="UTF-8"

Hello,
I would like to test linux with kernel version 5.4.47.
Is there any relation between ltp releases and kernel versions?
Regards,
Peter Gubka

--00000000000094251405b56630cb
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div>Hello,</div><div>I would like to test linux with kernel version 5.4.47. <br></div><div>Is there any relation between ltp releases and kernel versions?</div><div>Regards,</div><div>Peter Gubka<br></div><div><br></div></div>

--00000000000094251405b56630cb--

--===============0528521067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0528521067==--
