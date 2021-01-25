Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF7130239F
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 11:25:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D85D3C52B3
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 11:25:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 047243C3035
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 11:25:28 +0100 (CET)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.51])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 504F5600069
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 11:25:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1611570327;
 s=strato-dkim-0002; d=hartkopp.net;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:From:
 Subject:Sender;
 bh=X+F5eBx6hhPWWwcF9ubIsqkxUL4WeBCjYPW2wcv2gyg=;
 b=I6bsbPD1dqxtchkfJQDX8DLVvdI++q5c+wQCWNKFLrqbq85p30QicJ3uBK1nPxRMT9
 t/FCdyPiMY5RoGxqo4Ulr2gK9CUm+5MdbJG0w36Kvthjj2DUxcF11mLZs/ONiafHikS1
 /XgW0bnRwNpw7TRSqJj/t+WnibMpqHCSzm4f4IlrSoh8iqXMb08iXyANP0zyJAOFVaZW
 fjUhClvs/BL0QEz5LZPyPxEHZsb9BHADJECwtg2SeykXL6YJtplVrZFEUGrlhtg54Imu
 OCQpnUwAtV9FzOBbSKaF1GdYSr937mkSYvnmaaMVQNxFl1hYajduAV1fCKcL7jLZItzn
 fAtg==
X-RZG-AUTH: ":P2MHfkW8eP4Mre39l357AZT/I7AY/7nT2yrDxb8mjG14FZxedJy6qgO1o3TMaFqTEVR/J8xty10="
X-RZG-CLASS-ID: mo00
Received: from [192.168.10.137] by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
 with ESMTPSA id k075acx0PAPPxPs
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 25 Jan 2021 11:25:25 +0100 (CET)
To: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
References: <20210120143723.26483-1-rpalethorpe@suse.com>
 <20210120143723.26483-8-rpalethorpe@suse.com>
From: Oliver Hartkopp <socketcan@hartkopp.net>
Message-ID: <e39c4ae6-94df-9162-7357-d125ced72d17@hartkopp.net>
Date: Mon, 25 Jan 2021 11:25:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210120143723.26483-8-rpalethorpe@suse.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 7/7] can: Update contact details
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
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, linux-can@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



On 20.01.21 15:37, Richard Palethorpe wrote:
> socketcan-users appears to be no more.
> 
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>

Thanks for the cleanup and the rework, Richard!

Acked-by: Oliver Hartkopp <socketcan@hartkopp.net>
(for the entire series)

Best regards,
Oliver

> ---
>   testcases/network/can/filter-tests/00_Descriptions.txt | 5 +++--
>   testcases/network/can/filter-tests/Makefile            | 2 --
>   2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/testcases/network/can/filter-tests/00_Descriptions.txt b/testcases/network/can/filter-tests/00_Descriptions.txt
> index 55d213456..9623d29a0 100644
> --- a/testcases/network/can/filter-tests/00_Descriptions.txt
> +++ b/testcases/network/can/filter-tests/00_Descriptions.txt
> @@ -6,5 +6,6 @@ information on the CAN network protocol family PF_CAN is contained in
>   
>   For any issue(s) with CAN tests please write to:
>   <ltp@lists.linux.it>
> -<socketcan-users@lists.berlios.de>,
> -Oliver Hartkopp <oliver.hartkopp@volkswagen.de>,
> +Oliver Hartkopp <socketcan@hartkopp.net>
> +Linux-CAN ML <linux-can@vger.kernel.org>
> +
> diff --git a/testcases/network/can/filter-tests/Makefile b/testcases/network/can/filter-tests/Makefile
> index 29aaa3240..bd57c7fff 100644
> --- a/testcases/network/can/filter-tests/Makefile
> +++ b/testcases/network/can/filter-tests/Makefile
> @@ -14,8 +14,6 @@
>   #    You should have received a copy of the GNU General Public License along
>   #    with this program; if not, write to the Free Software Foundation, Inc.,
>   #    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> -#
> -#  Send feedback to <socketcan-users@lists.berlios.de>
>   
>   top_srcdir		?= ../../../..
>   
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
