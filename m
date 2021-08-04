Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D2C3DFDDE
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 11:21:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7D0E73C8088
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 11:21:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5EB5D3C7FF9
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 09:40:15 +0200 (CEST)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 131DC1A010F9
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 09:40:15 +0200 (CEST)
Received: by mail-pj1-x102a.google.com with SMTP id j1so1742710pjv.3
 for <ltp@lists.linux.it>; Wed, 04 Aug 2021 00:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ufsAD/3Qdi1T2HB3quxBOdR/T1U1h8GciPGwUgTjHCI=;
 b=qqocDoGSTbG1vEp6u73Alx+v/Hts8tf3aADkUHdMUM+qdnPusHXtBXwz5UV8Bi5Aay
 MSEByll6Ne+XnITdf9lRuktuFv/jdget/bDiltssjlXsx/jrlw+jCTSIIeVRY4AOpqI3
 P2dCZXuVbafOx2LGtlpLd9cN0Cl5xGApnS0hmc6LQfolI/ZC/9GKJ4IcSIjsc1L/15Pe
 i6cDkHrVV4jTL5IMqziWgBynBnEYLKFnDlmRZAiSTeqfukID/SgYlMunruRg3tZkAkst
 OqaLbg+3MxBJbCZaKKu+UJTMxEkhpYXd86wtoHGMmox5mLIlrhZxYsmiUQGH232D1+n+
 oyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ufsAD/3Qdi1T2HB3quxBOdR/T1U1h8GciPGwUgTjHCI=;
 b=Hu+XOgKXqqnVIK0MVkB5JnuTvEy2ZdM7gUynY06664zxVR7Vn1wWzkxxi6IVYsGaZ4
 o3e9masfVnFbNJCdAy16wmoOGo3ppYCpaPTgBk7Dn8bocOTKfVvGpN5q7TpBDi8VMCzK
 ExsojWHC8gU9kCaEwAQbVWMqcefD9hm7GQ7cTsyhUuRr4xrRUquz9mX1Jf3rARIoM8Ss
 YJ6EjKzxHRmGRanSeBBbmDapd42/RO/Y2alx/tfpOMjdIz9kv+kAqOw7bnt8AMInm0xn
 G4isuGnraY79912AeDqIHyBIqrpkvcX7nqimPr0TukS5DFTxkMUTNOZzdvLy5ldddrOd
 IbKg==
X-Gm-Message-State: AOAM533wiw1wpslg92eDGB8LM9FCvLiH0IAbBzjiS7cCK6GNYnVFs9pH
 a3SZhX0Roag/eAxK9Th4S/Ra8Q==
X-Google-Smtp-Source: ABdhPJyJzGt5DaIcM08PAh3ojkjZLyP/hOJ8VK8e6kqydHwEcjJ0mjGGqd66M4KyR8PZSrTHwFsxnw==
X-Received: by 2002:a62:8643:0:b029:3b1:a6ee:196 with SMTP id
 x64-20020a6286430000b02903b1a6ee0196mr23380719pfd.13.1628062813093; 
 Wed, 04 Aug 2021 00:40:13 -0700 (PDT)
Received: from google.com ([2401:fa00:9:211:7ff1:360d:6b2e:2bd2])
 by smtp.gmail.com with ESMTPSA id r18sm2164903pgk.54.2021.08.04.00.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 00:40:12 -0700 (PDT)
Date: Wed, 4 Aug 2021 17:40:00 +1000
To: krisman@collabora.com
Message-ID: <YQpEEQT358LYPbMX@google.com>
References: <20210802214645.2633028-1-krisman@collabora.com>
 <20210802214645.2633028-4-krisman@collabora.com>
 <CAOQ4uxjMfJM4FM4tWJWgjbK4a2K1hNJdEBRvwQTh9+5su2N0Tw@mail.gmail.com>
 <87fsvphksu.fsf@collabora.com>
 <CAOQ4uxj_WwDPxZv0nr9+Hh+pim6+2onaBdFq_BR-qK=xz+8yUg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxj_WwDPxZv0nr9+Hh+pim6+2onaBdFq_BR-qK=xz+8yUg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-12.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,FSL_HELO_FAKE,
 SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 04 Aug 2021 11:21:10 +0200
Subject: Re: [LTP] [PATCH 3/7] syscalls/fanotify20: Validate incoming FID in
 FAN_FS_ERROR
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
From: Matthew Bobrowski via ltp <ltp@lists.linux.it>
Reply-To: Matthew Bobrowski <repnop@google.com>
Cc: kernel@collabora.com, Khazhismel Kumykov <khazhy@google.com>,
 Jan Kara <jack@suse.com>, Ext4 <linux-ext4@vger.kernel.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Aug 04, 2021 at 08:39:55AM +0300, Amir Goldstein wrote:
> On Wed, Aug 4, 2021 at 7:54 AM Gabriel Krisman Bertazi
> <krisman@collabora.com> wrote:
> >
> > Amir Goldstein <amir73il@gmail.com> writes:
> >
> > > On Tue, Aug 3, 2021 at 12:47 AM Gabriel Krisman Bertazi
> > > <krisman@collabora.com> wrote:
> > >>
> > >> Verify the FID provided in the event.  If the testcase has a null inode,
> > >> this is assumed to be a superblock error (i.e. null FH).
> > >>
> > >> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> > >> ---
> > >>  .../kernel/syscalls/fanotify/fanotify20.c     | 51 +++++++++++++++++++
> > >>  1 file changed, 51 insertions(+)
> > >>
> > >> diff --git a/testcases/kernel/syscalls/fanotify/fanotify20.c b/testcases/kernel/syscalls/fanotify/fanotify20.c
> > >> index fd5cfb8744f1..d8d788ae685f 100644
> > >> --- a/testcases/kernel/syscalls/fanotify/fanotify20.c
> > >> +++ b/testcases/kernel/syscalls/fanotify/fanotify20.c
> > >> @@ -40,6 +40,14 @@
> > >>
> > >>  #define FAN_EVENT_INFO_TYPE_ERROR      4
> > >>
> > >> +#ifndef FILEID_INVALID
> > >> +#define        FILEID_INVALID          0xff
> > >> +#endif
> > >> +
> > >> +#ifndef FILEID_INO32_GEN
> > >> +#define FILEID_INO32_GEN       1
> > >> +#endif
> > >> +
> > >>  struct fanotify_event_info_error {
> > >>         struct fanotify_event_info_header hdr;
> > >>         __s32 error;
> > >> @@ -57,6 +65,9 @@ static const struct test_case {
> > >>         char *name;
> > >>         int error;
> > >>         unsigned int error_count;
> > >> +
> > >> +       /* inode can be null for superblock errors */
> > >> +       unsigned int *inode;
> > >
> > > Any reason not to use fanotify_fid_t * like fanotify16.c?
> >
> > No reason other than I didn't notice they existed. Sorry. I will get
> > this fixed.
> 
> No problem. That's what review is for ;-)
> 
> BTW, unless anyone is specifically interested I don't think there
> is a reason to re post the test patches before the submission request.
> Certainly not for the small fixes that I requested.
> 
> I do request that you post a link to a branch with the fixed test
> so that we can experiment with the kernel patches.
> 
> I've also CC'ed Matthew who may want to help with review of the test
> and man page that you posted in the cover letter [1].

I'll get around to going through both the LTP and man-page series by the
end of this week. Feel free to also loop me in directly on any subsequent
iterations of the like.

/M

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
