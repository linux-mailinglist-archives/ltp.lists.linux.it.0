Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA428CF223F
	for <lists+linux-ltp@lfdr.de>; Mon, 05 Jan 2026 08:14:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1767597273; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=OfLZT+R790A+Wkw0rpGvu8AbQ5FXWFUbti/zBc/g0/w=;
 b=SQha21kwkNH3ut1meOAWhSg4Dlu/tf/eoHGdOytIm3HtUJQ5HlGqEKy3QPHgNc6Y3Ffiz
 5K0HoiNvJwuIP3Gax5fdyhVrrLVkq4p3acx49ipL79iagdCUGc6QdzUyKTjZ9kixCghYzqz
 s8dukHB/GitKKmID92S6UT97vHp8ADA=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 584D73C2204
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Jan 2026 08:14:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DB9E93C1BDB
 for <ltp@lists.linux.it>; Mon,  5 Jan 2026 08:14:20 +0100 (CET)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9904B1A0035E
 for <ltp@lists.linux.it>; Mon,  5 Jan 2026 08:14:19 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4779ce2a624so108484375e9.2
 for <ltp@lists.linux.it>; Sun, 04 Jan 2026 23:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1767597259; x=1768202059; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aiAbqILz4z2irjXFPe9Mx7132pZtYDqw/HB4A4Wqh/E=;
 b=a5H8qprIITiHmM/dKcQeFzbCJ+SGH1cUONO0DGp0ylAUg77E5kyw1GHRUXxSmW5UvW
 UtqhLw9kA/6GrTvHxetGP5tIDEVa1075SwFKEz4SWm0qtwHRTqF4k+f2pLHC8yPVsq2N
 GoNBsS6hEbHRVtbJMNVO1eiv6fRQs66QzEmbdJ5NBqKxdKFlwas5HCdac5epCk11LrZG
 x3Dlw4sfU0TutX4D8hKUxbdGirW0Rfchd1O4v010yaQ9WPnNzPZzUcnZp+8y67dnZIus
 rJtERINYSpbUmmPuOXK1j4IGRcZk9bQt9IxlBSRA2ydrcIkgdECaDXeiLyiWpnCLZuPQ
 +zDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767597259; x=1768202059;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aiAbqILz4z2irjXFPe9Mx7132pZtYDqw/HB4A4Wqh/E=;
 b=A+hEXcwkz0RLK0iSTlzQEWMB3gaSeHHC+/hQM1lfglR1IgYA56lF6RVZ7xOQL6ykMt
 88Tc/zHMlRNuxd2S4k2ib1Go+hGPauKh41BKK0wIb5QY2YHoVrsPc265su0axaM3jH4y
 7oc8lx7ZeF+9TKb5Ue54Dl+yuNAO11n9dtf5eIzganK/ktLqYac7GjWV2j9+++3EL8m9
 eBugvDtcxZkFEOHR1Pt7hKNdLxFd6bFh3wh9Y/aUtoCOnF33ZMKPyeHVkTdAY34F8/xE
 PSvyaXt+41x66WpVuxsl80sgiSKsCNdN0CLOzrIpwwBbkbtGsSeaLBHXCYR2Jhk7S6xN
 50+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCURcCOXnZq02Sf9WNEM7rfMGek7hft48bxCCPRhSjOi6WkIjIFGz5wpf+oqN45dKH+P76A=@lists.linux.it
X-Gm-Message-State: AOJu0YysR06aE/dGw8bG6kluIw/455Z7Tqzra54QmeHtt9o+s3zFNmPr
 FYHjPjpkn3hg/MYytTSlFImTVIaWmZejmCf41NWbp5pVa2t1WTnIKoZs73j2PGPo2D2QlbfzQWs
 m6Qo+v6lWTQ==
X-Gm-Gg: AY/fxX71T8k7B8DWI0PJLy+jCiN4PMsYtwKG3prtf29CMlwftVq8v9B25ubU30HVCS8
 xTgzC+gRSxrBPLrFlX+hRU5Oh0mRJrRgwvoNbxPBw4tHdSHaqHX39VSVVme104MXQ0kagMnyviw
 fsTOd23f+P4ui3lO8HXeSNKbeafTeN9WNl/62hXcRkEXv+Ql5f4H5b3cEnRWKd6Uq3eFI1inEgA
 jx2N80SITE3NB6BpARbw84XL5uNK38goZ/LNQEa6aaLiZaka2U+1mEgNxsN3SI8fPS0kqN0g4Ee
 3hMAMS1JpBk3+VNKYG0xoFe1Ncz1HPg85y+DGIZXwzDCM4uzPSjZmV6g45RylvxC4Q1bzIaoo+8
 gizNwXRFba+986JF27IlvkIfy2nt4+QKu+zMOye1d9FzzDjm/UGXsa4ALrXvJBNuPj3r0oX4zt7
 gNl99APFfHSX5An2E=
X-Google-Smtp-Source: AGHT+IHR59UAPdvDPC+tkEy1P4S0QFTu2yZOgnAU0aPvXkBNXRBFeHaUK/tkhcm9VfOztr33kiEkFA==
X-Received: by 2002:a05:600c:348b:b0:477:a36f:1a57 with SMTP id
 5b1f17b1804b1-47d276f8aeemr554533835e9.3.1767597258843; 
 Sun, 04 Jan 2026 23:14:18 -0800 (PST)
Received: from localhost ([37.160.207.134]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea830fesm100020506f8f.20.2026.01.04.23.14.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jan 2026 23:14:18 -0800 (PST)
Mime-Version: 1.0
Date: Mon, 05 Jan 2026 08:14:07 +0100
Message-Id: <DFGGXHDQ8OSM.36FM2U880AQKZ@suse.com>
To: "Petr Vorel" <pvorel@suse.cz>, <ltp@lists.linux.it>
X-Mailer: aerc 0.18.2
References: <20251222094428.87910-1-pvorel@suse.cz>
In-Reply-To: <20251222094428.87910-1-pvorel@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v5] swapon03: Try to swapon() as many files until
 it fails
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!

> -	char cmd_buffer[256];
> +	char cmd_buffer[FILENAME_MAX+28];

I'm not sure if +28 is needed.

Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>

-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
