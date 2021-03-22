Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A43E344EB7
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Mar 2021 19:42:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 62B553C94ED
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Mar 2021 19:42:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id F2FF03C8C36
 for <ltp@lists.linux.it>; Mon, 22 Mar 2021 19:42:38 +0100 (CET)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A26E510005FA
 for <ltp@lists.linux.it>; Mon, 22 Mar 2021 19:42:38 +0100 (CET)
Received: by mail-il1-x12d.google.com with SMTP id y17so4166209ila.6
 for <ltp@lists.linux.it>; Mon, 22 Mar 2021 11:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gDLpLcBG74d+AVgpMMLTnpyub55ebeP9Qcp/8o8wEcg=;
 b=u2c7dxrhUL/UfG47hcPvQsdVNp38kaC0fH3wg8KPqhR/5td7Bp3bynl21c00Eyw76y
 uA8O1WvOJoHHiXykxSm9G+UB9dKECwpxoNh2Vt/7kb1guoA4s28WaJkrkNLyvFT9VayE
 4jS112ffUfJVGy7DpFr/nYW9hbXHtiYxiQtT69QSTeJ5UTIDF5RYRKnCps1+xHLLXFqD
 wb1rY9sg2wR3Axa55zbJVwQ4NLenI+0MKFVWOTRqF44oAXjFwdGTIu9Ct7TgLPJI7pJT
 UZ/cL32TxzRC/3ZOVOJ2U63x1OnhL/X2TFOxztf6djmKNqZCek/SzZeTmB/n87GcqWAu
 NNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gDLpLcBG74d+AVgpMMLTnpyub55ebeP9Qcp/8o8wEcg=;
 b=lBeyijGSCl8GIuE7yt5ADARXHgQ+GgwFI0BvH/hrbqNhOkhmUzz+CuCfVf+GvFLiDR
 ONJ9nNxbG/skMl0eBuRgtlcOWJiyV6lT/5ipJ0qtaIGEDvLwqjaTGuQJToA3Jnnn/lvU
 7MRDUWMU4IO7+SlxGcsqgAr/eUrn42GCGTlNxaOxdLjP/1o/EvUbCiZBfHkQrzwE6STA
 feQSfN3CEHheJf2DCq9ArXTU1fOIJ9xfOtfim1ayIAlN5SvJoTm0H4ggKOUMBWsTWD18
 X/7Nc/ICv90n4VYnmj9BDid5SShQRtbNbIXXWNMlOGkfBfI/uecvWgvQJCITn4NnJTVA
 m6kg==
X-Gm-Message-State: AOAM530Xgiz7i97A6sbTR+BXRtt8WE6qctcNn8n3pH4BN60q1WYZSj0j
 ahcAn94WRBA9xKrVQohkU6eQeUR2E6Nr/iQUdT1WV2PS
X-Google-Smtp-Source: ABdhPJwkbyMLMs0QU7O/iiltpFyvbzdHC49/X4AE161w7jZgffok+YZ16WcUHLxwoyP8M2cuBQwDSz+pkeqhsQMxeP4=
X-Received: by 2002:a92:50b:: with SMTP id q11mr1264975ile.250.1616438557532; 
 Mon, 22 Mar 2021 11:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210318131134.3562203-1-amir73il@gmail.com>
 <YFShR2Qd7Ubve1wi@pevik>
 <CAOQ4uxhLOqfarhXa-mnPnUtSXVUr1cpz79bm3TE6c5=4oo-Eeg@mail.gmail.com>
 <YFeo7vI58VMA6W7a@pevik>
In-Reply-To: <YFeo7vI58VMA6W7a@pevik>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 22 Mar 2021 20:42:26 +0200
Message-ID: <CAOQ4uxjWTKncGxcOfT9XJ8REXZt9fdB7QsWRT74hUrB8mkNg-Q@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/8] fanotify tests for v5.13
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, Jan Kara <jack@suse.cz>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Sun, Mar 21, 2021 at 10:13 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Amir,
>
> > Whatever you think is best for your project users.
> > If you want to document the commits that added the features, I suggest
> > that you wait until those commits hit master (next cycle).
> > These are the relevant commit subjects:
>
> >    fanotify: configurable limits via sysfs
> >    fanotify: support limited functionality for unprivileged users
>
> Thanks a lot!
> IMHO being in next tree should be ok (commits hashes should be kept).
>

There is no such guarantee, certainly not so far from the v5.13 merge
window, so I advise against including the commit ids at this point.
The commit subject is descriptive enough IMO and you can add commit
ids later on if you think it is necessary.

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
